# Gaming-Behavior-Analytics-Platform
Multi-source data platform analyzing gaming behavior to help parents monitor children's gaming habits and understand emotional impact.
##  Project Overview

**Problem:** Parents lack visibility into their children's gaming behavior and emotional impact.

**Solution:** Built a data platform consolidating 4 sources into unified Azure PostgreSQL database, enabling behavioral analytics and emotional risk prediction.
**Impact:**
- Reduced manual data processing by **40%** through automated ETL pipelines
- Improved data consistency by **30%** through validation processes
- Achieved **85% accuracy** in emotional risk prediction using Random Forest
- Enabled analysis of **3,000+ games** with real-time dashboards

## Technologies Used

- **Languages:** Python, SQL
- **Database:** Azure PostgreSQL
- **Libraries:** pandas, numpy, scikit-learn, psycopg2
- **APIs:** RAWG API integration
- **Tools:** Jupyter Notebook, Lucidchart, Jira, Confluence
- **Cloud:** Microsoft Azure
## Key Features

### 1. Multi-Source Data Integration
- Consolidated 4 different data sources (CSV, RAWG API, research papers, Steam)
- Built Python ETL pipelines for automated ingestion
- Standardized data across disparate formats

### 2. Database Design
- Designed normalized relational schema (Users, Games, Sessions, Emotions)
- Implemented targeted indexes reducing query times by 30%
- Created views for weekly emotion summaries

### 3. Predictive Modeling
- Engineered composite features from duration, genre, violence tags, ACB ratings
- Trained Random Forest classifier achieving 85% accuracy
- Implemented rule-based emotion prediction from research papers

### 4. Data Quality & Governance
- Reduced data inconsistencies by 30% through validation
- Comprehensive Data Management Plan covering privacy, ethics, legal compliance
- Structured archiving and version control
## 📁 Project Structure
```
├── notebooks/        # Jupyter notebooks for data analysis
├── sql/             # Database schema and queries
├── data/            # Sample datasets
├── docs/            # Data Management Plan and documentation
└── images/          # Visualizations and diagrams
```
