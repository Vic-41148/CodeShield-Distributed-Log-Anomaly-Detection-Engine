#include "structures.h"

int compute_score(EntityStats *e)
{
    return (e->failed_attempts * 3) + (e->resource_count * 2) + (e->ip_count * 4);
}

int compute_ip_score(IPStats *ip)
{
    return ip->failed_attempts * 3;
}

/* Wrapper function for backward compatibility */
int compute_user_score(EntityStats *e)
{
    return compute_score(e);
}

void evaluate_entity(SharedState *state, EntityStats *e, const char *ip)
{
    int score = compute_score(e);
    int sev = severity_from_score(score);

    /* Check thresholds from problem statement */
    if (e->failed_attempts >= THRESH_FAILED_IP ||
        e->resource_count >= THRESH_RESOURCES ||
        e->ip_count >= THRESH_IPS)
    {
        /* only alert on SUSPICIOUS or higher */
        if (sev >= 1 && score != e->last_alert_score)
        {
            AlertItem item;
            item.user_id = e->user_id;
            strncpy(item.ip_address, ip, 39);
            item.ip_address[39] = '\0';
            item.score = score;
            item.severity = sev;
            item.timestamp = time(NULL);

            push_alert(state, item);
            e->last_alert_score = score;
            e->last_alert_time = time(NULL);
        }
    }
}

/* NO evaluate_ip here - it's in analyzer.c */
/* NO analyzer_thread here - it's in analyzer.c */