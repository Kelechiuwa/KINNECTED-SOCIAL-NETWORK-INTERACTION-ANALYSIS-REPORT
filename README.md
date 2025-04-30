# KINNECTED-SOCIAL-NETWORK-INTERACTION-ANALYSIS-REPORT
PostgreSQL Project

Kinnected Social Network Interaction Analysis 
The objective was to analyze a social network's structure, measure user influence, and generate actionable insights using PostgreSQL.



 PROJECT SUMMARY
*Kinnected** is a social platform where users have influence scores and can form friendships with others.  
This analysis explores key aspects of the network such as:
- Who are the most connected and influential users?
- Are there isolated users or untapped friendships?
- How do users compare to their friends in terms of score?
- What strategic recommendations can be made to improve engagement?


DATASET OVERVIEW
Two datasets were used:
1. *person_data.csv*
   - `Person_id`
   - `Name`
   - `Score` 

2. *friend_data.csv*
   - `Person_id`
   - `Friend_id`


BUSINESS QUESTIONS ANSWERED
1. Identify persons whose friends' total scores exceed 100  
2. Find the highest-scoring friend for each person  
3. Detect users with no friends (isolated)  
4. Find the user with the most friends  
5. Detect mutual friends between any two persons  
6. Calculate the average friend score for each user  
7. Identify users whose friends outperform them  
8. List possible untapped friendship pairs  
9. Find friend pairs with close scores (≤10 difference)  
10. Sum total friend scores for each user  

Each query was written in SQL and executed using PostgreSQL.



KEY RESULT
Total Users -- 5 
Total Friendships -- 7 
Most Connected User -- Tara (3 friends) 
Average Friends per User --1.4 
Isolated Users -- John 
Average Friend Score -- 45.29 
Untapped Friendships -- 5 pairs 



INSIGHTS
* Bob-- has friends with the highest total score (115), despite fewer connections.
* Tara-- is the most socially connected user and could act as a hub or community leader.
* John-- has no friends in the network and requires re-engagement.
* Davis-- benefits from high-performing friends, indicating a strong peer group.


RECOMMENDATIONS
* Engage Isolated Users**: Users like John should be targeted for re-engagement.
* Encourage Quality Connections**: Promote friendships based on score compatibility.
* Leverage Influencers**: Use Tara and Bob as ambassadors or mentors.
* Suggest New Connections**: Enable features like “People You May Know” to form the 5 untapped pairs.
* Foster Diversity**: No existing friendships had similar scores — create incentives to connect across skill levels.


 Key Performance Indicators (KPIs)
- Total Users  
- Total Friendships  
- Average Friends per User  
- Isolated User Rate  
- Average Friend Score  
- Potential Friendship Conversion Rate  
- Influencer Engagement Index


Tools & Tech
* PostgreSQL-- (SQL logic and querying)
* MS Word-- (Report presentation)
* GitHub--(Version control and documentation)


 REPORT
The full project report with queries, results, insights, KPIs, and recommendations is available in the `KINNECTED SOCIAL NETWORK INTERACTION ANALYSIS REPORT.docx` file.

 CONTACT
Name: Uwanaka Immeldah Kelechi  
Email: uwanakakelech@gmail.com  
Role: Data Analyst  


