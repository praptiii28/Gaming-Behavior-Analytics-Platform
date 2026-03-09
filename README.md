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
## Project Structure
```
├── notebooks/        # Jupyter notebooks for data analysis
├── sql/             # Database schema and queries
├── data/            # Sample datasets
├── docs/            # Data Management Plan and documentation
└── images/          # Visualizations and diagrams
```
## How to Use

### Prerequisites
```bash
Python 3.9+
PostgreSQL
Jupyter Notebook
```

### Installation
```bash
# Clone repository
git clone https://github.com/yourusername/Gaming-Behavior-Analytics-Platform.git

# Install dependencies
pip install -r requirements.txt

# Set up database
psql -U postgres -f sql/ITERATION3_1.sql
```

### Run Analysis
```bash
# Open Jupyter notebook
jupyter notebook notebooks/Iteration_2-3.ipynb
```

## Key Results

- **Data Integration:** Successfully consolidated 4 data sources
- **Performance:** 30% faster query execution through optimized indexing
- **Quality:** 30% reduction in data inconsistencies
- **Automation:** 40% reduction in manual processing effort
- **Prediction:** 85% accuracy in emotional risk classification

## 📊 Database Schema

**Core Tables:**
- `Users` - Child demographics
- `Games` - Game metadata (genre, platform, ACB ratings)
- `Sessions` - Gameplay activity logs
- `Emotions` - Predicted emotional outcomes
- `Emotion_Prediction` - Research-based rule tables

**Key Views:**
- `weekly_game_emotion_summary` - Aggregated weekly insights
- `genre_emotion_engagement_summary` - Genre-emotion mappings

## Documentation

Full technical documentation including data sources, preparation methods, storage architecture, and ethical considerations available in `docs/Data_Management_Plan.pdf`

## 🔒 Privacy & Ethics

- All datasets are open-access and de-identified
- User data pseudonymized using hashed identifiers
- Encryption at rest (PostgreSQL on Azure)
- HTTPS-secured API calls
- Compliant with Australian Privacy Act 1988

## 👨‍💻 Author

**Prapti Dinesh**
- Master of Data Science, Monash University (2025)
- 📧 Email: praptid2002@gmail.com
- 💼 LinkedIn: [linkedin.com/in/prapti-d-72927a215](https://linkedin.com/in/prapti-d-72927a215)

## 📚 Project Context

Academic industry project (FIT5120) delivered using Agile methodology with stakeholder workshops, sprint planning, and iterative delivery.

## 📄 License

MIT License - see LICENSE file for details

---

**Note:** This repository contains sample data and code for portfolio demonstration. Full datasets are not included to protect privacy and comply with data governance policies.
```

---



