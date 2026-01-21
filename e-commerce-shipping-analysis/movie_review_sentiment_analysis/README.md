# Movie Review Sentiment Analysis
**An Exploration of Unstructured Text Through NLP and Machine Learning**

## 📌 Project Overview
This project performs an end-to-end sentiment analysis on the Kaggle Movie Review dataset (156,000+ reviews). The objective is to classify reviews into five sentiment categories, ranging from negative to positive, using a combination of traditional machine learning and modern Natural Language Processing (NLP) techniques.

### Key Objectives:
* **Predictive Modeling:** Build a robust classifier to automate sentiment detection.
* **Class Imbalance:** Implement **SMOTE** (Synthetic Minority Over-sampling Technique) to address skewed sentiment distributions.
* **Linguistic Analysis:** Use **SpaCy** for Named Entity Recognition (NER) to identify key actors and directors driving audience engagement.
* **Stakeholder Communication:** Provide distinct deliverables for technical and non-technical audiences.

---

## 📂 Repository Structure
* `movie_review_sentiment_analysis.ipynb`: The primary technical notebook containing the full pipeline and technical documentation.
* `movie_review_sentiment_analysis.html`: A static, browser-ready version of the technical notebook.
* `movie_review_sentiment_analysis_no_code.html`: A high-level report designed for stakeholders, focusing on visualizations and insights while hiding the underlying code.
* `train.tsv` / `test.tsv`: The dataset files.

---

## 🛠️ Tech Stack & Methodology
### 1. Preprocessing & Feature Engineering
* **NLP Pipeline:** Tokenization, Lemmatization, and Stop-word removal via `NLTK`.
* **Vectorization:** TF-IDF (Term Frequency-Inverse Document Frequency) to transform text into a 2,000-feature sparse matrix.
* **Scaling:** Utilized `MaxAbsScaler` to maintain sparsity while normalizing feature importance.



### 2. Modeling & Evaluation
We compared multiple architectures to identify the optimal balance between speed and precision:
* **LinearSVC:** Optimized for high-dimensional text data. (Selected as **Best Model**)
* **Multinomial Naive Bayes (MNB):** Baseline probabilistic classifier.
* **Evaluation Metrics:** Weighted F1-Score, Precision, and Recall to account for multi-class distributions.



### 3. Advanced Insights
* **NER (Named Entity Recognition):** Leveraged SpaCy to extract entities, allowing the identification of specific talent associated with positive sentiment.
* **Topic Modeling:** Clustered reviews to uncover latent themes like "Cinematography," "Plot Inconsistency," and "Casting."



---

## 📊 Key Results
* **Balanced Accuracy:** Achieved an F1-score of **58.3%**, aligning with academic benchmarks for 5-class fine-grained sentiment analysis.
* **SMOTE Impact:** Successfully balanced the training set, increasing the recall for minority classes.
* **Kernel Performance:** Confirmed that linear kernels (`LinearSVC`) outperformed non-linear RBF kernels in high-dimensional TF-IDF space.

---

## 🚀 How to Run
1.  **Clone the repo:**
    ```bash
    git clone [https://github.com/deodice/portfolio.git](https://github.com/deodice/portfolio.git)
    ```
2.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    python -m spacy download en_core_web_sm
    ```
3.  **Run the Notebook:** Ensure `train.tsv` and `test.tsv` are in the root directory and run `movie_review_sentiment_analysis.ipynb`.

---

## 🤝 Contact
**Derek Eodice, MBA, MSc** [LinkedIn](https://www.linkedin.com/in/deodice/) | [GitHub Portfolio](https://github.com/deodice/portfolio)
