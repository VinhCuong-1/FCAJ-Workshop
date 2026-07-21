---
title: "DynamoDB Database: MatchmakingQueue & ActiveMatches"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.2. </b> "
---

### DynamoDB Database: MatchmakingQueue & ActiveMatches

Amazon DynamoDB is the NoSQL database used to store the **matchmaking queue state** and **active matches** in real time. Two tables need to be created:

| Table | Purpose |
|-------|---------|
| `MatchmakingQueue` | Stores the list of players waiting to find a match |
| `ActiveMatches` | Stores information about ongoing matches |

#### Steps

1. [Create MatchmakingQueue Table](5.2.1-MatchmakingQueue/)
2. [Create ActiveMatches Table & Verify](5.2.2-ActiveMatches/)
