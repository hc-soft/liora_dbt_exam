Projet Exam CYR DBT 

# Overview
Projet DBT/Snowflake pour Formation Data Engineer

# Info Snowflake
Database : exam
Schema : exam

Utilisation du Scriot init.sql utilisé lors de l'exam Snowflake pour charger les tables de base dans la Database exam

J'ai appliqué la method medaillon :
 - bronze : Tables chargées par le script init
 - Silver : Vues basée sur tables Bronze et separation des composer
 - Gold : Architecture en etoile (star) et vues

le dbtLog contient le build et le run (version fonctionnelle , j'ai supprimé les different essais et correction d'erreur)

### Using the starter project
Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
# liora_dbt_exam
