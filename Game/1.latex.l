\documentclass[journal]{IEEEtran}
\usepackage{amsmath,amssymb,amsfonts,amsthm}
\usepackage[scheme=plain]{ctex}
\usepackage{booktabs}
\usepackage{newtxtext}
\usepackage{minted}
\usepackage{xcolor}
\usepackage[ruled,vlined]{algorithm2e}
\usepackage{graphicx}
\usepackage{microtype}
\usepackage[margin=1in]{geometry}
\usepackage{url}

\usepackage[bookmarks,hidelinks,colorlinks=false,pdfstartview=FitH]{hyperref}
\usepackage[capitalise,nameinlink]{cleveref}

\setminted{
    frame=lines,
    fontsize=\small,
    breaklines=true,
    breakanywhere=true
}

\title{Emotion Detection from Text Using Al}
\author{WANG,Jianlin , LIU,Xiaoyu , XIAO Weiting , ZHANG Xianghao , DUAN Longqi }
\date{\today}

\begin{document}

\maketitle

\begin{abstract}
This project aims to use AI techniques for text-based sentiment detection and explore its potential for application in various fields. We mainly used Transform and BERT algorithms to systematically analyze the emotional information in the text, such as happiness, sadness, anger, etc., through Natural Language Processing (NLP) and machine learning algorithms. The project employs a variety of approaches, including traditional machine learning techniques such as support vector machines and decision trees as well as advanced deep learning models such as RNN and BERT, to improve the accuracy and efficiency of sentiment prediction.
This study not only focuses on the implementation of the algorithm, but also emphasizes the practical applications of emotion detection in customer service, social media monitoring, and mental health support. By analyzing user feedback in real time, companies are able to improve customer experience and enhance market insights. In addition, the project also discusses the challenges faced by emotion detection, such as language ambiguity and data privacy issues.
Ultimately, the results of this project provide an important reference for the future development of emotion detection and demonstrate the great potential of artificial intelligence in understanding and responding to human emotions.

\end{abstract}

\begin{IEEEkeywords}
Emotion detection, Artificial intelligence, Transform, BERT, Natural Language Processing, Machine learning Deep learning
\end{IEEEkeywords}  

\section{Introduction}

Artificial Intelligence (AI) is sparking a revolution in various fields, and one of the most promising applications is text-based sentiment detection. This report explores the mechanisms, methodologies, and potential applications of emotion detection systems, highlighting their importance in enhancing human-computer interaction and understanding user emotions.
\subsection{Overview of emotion detection}
Emotion detection, also known as sentiment analysis, involves identifying and classifying emotions expressed in text. This process helps businesses, researchers, and developers analyze user sentiment, improve the user experience, and tailor products or services to customer needs. Common emotions in the text include: happiness, sadness, anger, fear, surprise, disgust.
\subsection{The importance of text-based sentiment detection}
1.2.1.	Improve customer experience 
Sentiment detection can analyze customer feedback and social media comments in real time to help businesses understand the emotional state of their customers. This enables businesses to deal with complaints in a timely manner, improve service, and enhance customer satisfaction and loyalty. 
1.2.2.	Enhanced market insight
By analyzing user sentiment, companies can gain insights into market trends and consumer preferences. This helps in product development, marketing strategy and brand management to better meet market needs. 
1.2.3.	Mental health support 
The application of emotion detection in the field of mental health is increasing. By analyzing patients' verbal communication, professionals can better understand patients' emotional changes and provide personalized support and interventions.
1.2.4	Social media monitoring
Brands and organizations can use sentiment detection to monitor the public's reaction to their products or services and adjust marketing strategies and PR activities in a timely manner to maintain brand image and reputation.
1.2.5	Content recommendation system
On content platforms, sentiment detection can help algorithms recommend appropriate content based on a user's current mood, thereby enhancing user experience and engagement.
1.2.6	Crisis management
In crisis situations, sentiment detection can monitor public sentiment in real time, help organizations quickly understand the dynamics of public opinion, and take appropriate response measures to mitigate negative effects.
1.2.7	Natural language processing development
Sentiment detection has driven the development of natural language processing technologies and facilitated research into more complex algorithms and models, such as deep learning and transfer learning, and these advances have positive implications for other AI applications as well.

Text-based sentiment detection not only has wide application potential in the fields of business and science and technology, but also shows important value in mental health and social research. With the continuous progress of technology, the accuracy and application range of emotion detection will continue to expand, further enhancing its influence in various fields.
\section{Text-based sentiment detection and AI}
\subsection{The relationship between text-based sentiment detection and AI}
There is a strong relationship between text-based sentiment detection and artificial intelligence (AI). Advances in AI technology have significantly improved the accuracy and efficiency of sentiment detection, and here are a few key aspects of the relationship: 1. Natural Language Processing (NLP) techniques
NLP is an important subfield of AI that focuses on the interaction of computers with human language. Sentiment detection relies on NLP technology, and AI is able to understand the semantics and sentiment of the text through word segmentation, part-of-speech tagging, and syntactic analysis.
2. Machine and Deep Learning
Emotion detection systems typically use machine learning and deep learning algorithms to train models. By analyzing large amounts of labeled text data, AI is able to learn complex relationships between sentiment and lexical and syntactic structures for sentiment classification.
3. Data-driven decision-making
AI is capable of processing and analyzing massive amounts of data, providing real-time feedback through sentiment analysis. This enables companies to make more accurate market decisions and customer service improvements based on data.
\subsection{An AI approach to the problem of Text-based Emotion Detection}
2.2.1	Natural language processing (NLP) methods
Text preprocessing: Includes steps such as word segmentation, removal of stop words, and stemming to improve the accuracy of subsequent analysis.
Feature extraction: Methods such as bag-of-words model and TF-IDF (Term Frequency-inverse Document Frequency) are used to convert the text into numerical features for easy processing by machine learning algorithms.
2.2.2	Machine learning method
Supervised learning: Train a model using a labeled dataset. Common algorithms include:
1. Support Vector Machine (SVM): Effectively handle high-dimensional data, suitable for small sample sentiment classification.
2.Decision tree: Sentiment classification is done by building a tree structure that is easy to interpret.
3.Random forests: Ensemble learning methods that improve accuracy through multiple decision trees.
Unsupervised learning: For working with unlabeled data, commonly used techniques include clustering (like K-means) and topic modeling (like LDA). 
2.2.3	Deep learning method
Recurrent Neural Networks (RNNS): Particularly well suited for sequential data, capable of capturing temporal dependencies in text.
Long Short-Term Memory (LSTM): A special type of RNN that can effectively retain long-distance dependency information and is suitable for complex sentence analysis in sentiment detection.
Convolutional Neural Networks (CNN): Commonly used for image processing, but also effective in sentiment analysis, extracting local features via convolution operations. 
2.2.4	Pretraining model
Transformers: Pre-trained models such as BERT or GPT that understand context and capture nuanced sentiment information. By fine-tuning these models, we can achieve high accuracy on specific tasks.
2.2.5	Multimodal learning
Combine multiple data sources such as text, images and audio to comprehensively analyze emotions. Through multimodal learning, emotional features can be captured more comprehensively.
\section{Comparison of AI Approaches for Processing text-based sentiment prediction}
\subsection{Natural language processing (NLP) methods}
Advantages:
1)	Simple and easy to implement: preprocessing and feature extraction methods are relatively intuitive and easy to get started with.
2)	Strong interpretability: Traditional methods such as bag-of-words models are easy to understand and explain.

Cons:
1)	Feature sparsity: Simple feature extraction may lead to information loss and fail to capture the complex sentiment of the text.
2)	Inability to process context: Lack of context understanding and low accuracy of emotion recognition.
\subsection{Machine learning method}
Advantages:
1)	Efficient: Performs well on smaller datasets and is fast to train.
2)	Flexibility: Different algorithms (e.g., SVMS, decision trees) can be selected according to specific needs.

Cons:
1)	Rely on manual feature engineering: Features need to be carefully designed, increasing effort.
2)	Poor adaptability to large scale data: performance may degrade when dealing with large amounts of data.
\subsection{Deep Learning Method (RNN/LSTM)}
Advantages:
1)	Strong context capture: Ability to process long sequences of data and understand sentiment changes in sentences.
2)	Automatic feature learning: Instead of manually extracting features, the model is able to learn automatically.

Cons:
1)	High computational resource demand: Training deep learning models requires significant computational resources and time.
2)	Poor interpretability: The model is complex and it is difficult to explain its decision process.
\subsection{Pre-trained models (e.g. BERT/GPT)}
Advantages:
1)	High accuracy: Performs well on multiple tasks and understands complex contexts.
2)	Transfer learning ability: can fine-tune on small datasets and perform well.

Cons:
1)	High resource consumption: Large computational resources are required for training and inference.
2)	Large model size: usually requires large storage space and is inconvenient to deploy.
\subsection{Multi-modal learning}
Advantages:
1)	Integrated information sources: Multiple data sources such as text, image and audio are combined to provide a more comprehensive sentiment analysis.
2)	Improved accuracy: It can capture the relationship between different modalities and enhance the ability of emotion recognition.
Cons:
1)	High complexity: Data processing and model design are relatively complex and require more engineering effort.
2)	High dataset demand: Multi-modal labeled data is required and difficult to obtain.

Different methods have their own advantages and disadvantages in text-based sentiment prediction. The selection of an appropriate method should be comprehensively considered according to the specific application scenario, data scale, and resource constraints. For complex scenarios, deep learning and multi-modal learning may be more advantageous, while in resource-constrained situations, traditional machine learning methods and NLP fundamentals may be more appropriate.


\subsection{Illustration of the data for text-based sentiment detection}
Table I shows the dataset of text-based emotion detection, taking three basic emotions: happiness, anger, and sadness as an example \cite{heMaskRCNN2017}.


\begin{table}[htb]
\centering
\caption{Table of emotion training datasets}
\label{tab:example}
\begin{tabular}{lcr}
\toprule
\textbf{emotion} & \textbf{Amount of data}  \\
\midrule
Happiness        & 33                            \\
anger            & 33                             \\
Sadness          & 33                             \\
\bottomrule
\end{tabular}
\end{table}

\subsection{Table 2 shows the text: "Today is so happy, everything is going well!" For example, predict the emotion: sadness, and the confidence of various emotions. }
\cite{heMaskRCNN2017}

\begin{table}[htb]
\centering
\caption{Examples of training representations for emotion detection}
\label{tab:example}
\begin{tabular}{lcr}
\toprule
\textbf{emotion} & \textbf{Amount of data} & \textbf{Confidence level} \\
\midrule
Happiness         & 33                & 0.32                \\
Anger             & 33                & 0.35               \\
Sadness           & 33                & 0.33                \\
\bottomrule
\end{tabular}
\end{table}
\subsubsection{Subsubsection Heading Here}
Model source code based on BERT and Transformer training, including training, tuning, deployment debugging and online release.
\cite{heMaskRCNN2017,huangMaskScoringRCNN2019}.


\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_4.jpg}
    \caption{
    - Created the EmotionAnalyzer class to encapsulate the sentiment analysis function
    - Used the multilingual BERT model to support Chinese text analysis
    - Can identify multiple emotions (happy, sad, angry, fearful, neutral)
    - Provides confidence in sentiment prediction
    - Returns the probability distribution of all possible emotions}
    \label{fig:my_label}
\end{figure}

\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_5.jpg}
    \caption{
    Register a Hugging Face account
    Visit the Hugging Face official website Click the "Sign up" button in the upper right corner of the website. You can choose to register with an email address or authorize login through a third-party account such as Google or GitHub. Follow the prompts to complete the registration process. This step requires providing a valid email address and setting a password.

    Generate a token
    After logging in to your Hugging Face account, click your avatar in the upper right corner and select "Settings" in the drop-down menu.
    In the settings page, find the "Access Tokens" tab.

    Use Token
    When you use Hugging Face's API or need to access your account-related resources in the code (such as loading private models or datasets), you can use this token as authentication information. For example, when loading a model from Hugging Face Hub using the transformers library, you can use this token by setting the environment variable HF_AUTH_TOKEN, like this (in Python):


    Or in the command line, some tools may support passing the token via the --token parameter, such as commands related to huggingface-cli.
    }
    \label{fig:my_label}
\end{figure}

\begin{figure}[h!]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_6.jpg}
    \caption{
    1. Prepare and load the dataset (emotion_data.csv)
Data reading
In the code, we first use the pandas library to read the emotion_data.csv file. pandas is a powerful data processing library that is often used to read, process, and analyze data.
For example, there may be code like data = pd.read_csv('emotion_data.csv') to load the data in the CSV file into a DataFrame object.

Data preprocessing
After loading the data, some preprocessing operations are usually required. This may include:
Cleaning data: removing null values, duplicate values, etc. For example, data = data.dropna() can be used to remove rows containing null values.

Text normalization: converting text to a uniform format, such as converting all letters to lowercase, removing punctuation, etc.
Tokenization: splitting text into words or sub-words. This is an important step in natural language processing because models are usually trained and processed based on tokens.

2. Use the transformers library for natural language processing tasks (sentiment analysis)

Model selection and loading
The transformers library provides many pre-trained natural language processing models. For sentiment analysis tasks, you can choose a suitable model, such as BERT (Bidirectional Encoder Representations from Transformers), RoBERTa, etc.
AutoTokenizer and AutoModelForSequenceClassification may be used in the code to automatically load suitable tokenizers and classification models. For example:

python

from transformers import AutoTokenizer, AutoModelForSequenceClassification
tokenizer = AutoTokenizer.from_pretrained('bert-base-uncased')
model = AutoModelForSequenceClassification.from_pretrained('bert - base - uncased')

Data conversion and encoding

After loading the model, you need to convert the pre-processed text data into a format that the model can accept. This usually involves using a tokenizer to convert the text into tokens and adding special tags (such as [CLS] and [SEP]).
Then, convert the tokens into a numeric encoding that the model can handle (using word embedding). For example:

python

inputs = tokenizer(texts, padding=True, truncation=True, return_tensors='pt')

Model training and evaluation

The encoded data is fed into the model for training. In sentiment analysis, the model learns to classify text into different sentiment categories (such as happy, sad, angry, etc.).
During training, loss functions (such as cross entropy loss) and optimizers (Adam) are used to adjust the model's parameters to minimize the loss.

After training, the model is evaluated using test data. Common evaluation metrics include accuracy, recall, F1-score, etc.}
    \label{fig:my_label}
\end{figure}

\begin{figure}[h!]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_1.jpg}
    \caption{Training 100 original training data sets containing emotional texts}
    \label{fig:my_label}
\end{figure}


\begin{figure}[h!]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_2.jpg}
    \caption{Test with 5 pieces of text data containing emotions}
    \label{fig:my_label}
\end{figure}

\begin{figure}[h!]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_3.jpg}
    \caption{Deploy the trained small model containing sentiment judgment to Hugging Face}
    \label{fig:my_label}
\end{figure}

\section{Python Code Example}

\begin{minted}[linenos,mathescape=true]{python}
from transformers import AutoTokenizer, AutoModelForSequenceClassification, Trainer, TrainingArguments
import torch
from datasets import Dataset, DatasetDict
import pandas as pd
import numpy as np
import os
from huggingface_hub import snapshot_download
from dotenv import load_dotenv
import json
from sklearn.metrics import accuracy_score, precision_recall_fscore_support
from huggingface_hub import HfApi

# Load environment variables
load_dotenv()

# Load configuration
with open('config.json', 'r') as f:
    config = json.load(f)

# Login with the token in the configuration
import huggingface_hub
huggingface_hub.login(token=config['huggingface_token'])

# Use other parameters in the configuration
model_name = config['model_name']
model_save_path = config['model_save_path']

# 1. Prepare data
emotion_data = [
    # Happy category (about 33 items)
    {"text": "The sun is shining brightly today. I went out to play for a whole day. I'm so happy!", "label": "Happy"},
    {"text": "I won the lottery. I feel like the luckiest person in the world. Hahaha!", "label": "Happy"},
    {"text": "I finally got the ideal job offer. I'm so excited!", "label": "Happy"}
    # Angry category (about 33 items)
    {"text": "That guy went too far. He shouted at me for no reason. I'm so angry!", "label": "Angry"},
    {"text": "I was late for work again and was severely criticized by my boss. I'm really angry inside.", "label": "Angry"},
    {"text": "I waited in line for two hours, but then I was told that it was sold out. It's really infuriating!", "label": "Angry"}
    # Sad category (about 34 items)
    {"text": "My pet dog that I had raised for many years passed away. I feel empty and so sad.", "label": "Sad"},
    {"text": "I didn't do well in this exam. I feel that all my efforts were in vain. I'm in a particularly low mood.", "label": "Sad"},
    {"text": "The days after breaking up are really hard. I always think of the past.", "label": "Sad"}
    # 2. Convert labels to numbers
label_dict = {"Happy": 0, "Angry": 1, "Sad": 2}
for item in emotion_data:
    item["label"] = label_dict[item["label"]]

# 3. Create datasets
np.random.seed(42)
random_indices = np.random.permutation(len(emotion_data))
train_size = int(0.8 * len(emotion_data))

train_data = [emotion_data[i] for i in random_indices[:train_size]]
val_data = [emotion_data[i] for i in random_indices[train_size:]]

train_dataset = Dataset.from_list(train_data)
val_dataset = Dataset.from_list(val_data)

dataset = DatasetDict({
    'train': train_dataset,
    'validation': val_dataset
})

# 4. Model and tokenizer
# Use a smaller Chinese model
model_name = "hfl/chinese-bert-wwm-ext"  # Replace with another commonly used Chinese pre-trained model

try:
    # Try to download the model
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    model = AutoModelForSequenceClassification.from_pretrained(
        model_name,
        num_labels=3,
        trust_remote_code=True
    )
except Exception as e:
    print(f"Error loading model: {e}")
    # If the download fails, try using other alternative models
    model_name = "bert-base-multilingual-cased"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=3)
# 5. Data preprocessing
def tokenize_function(examples):
    # Add simple data augmentation
    texts = examples["text"]
    labels = examples["label"]
    augmented_texts = []
    augmented_labels = []
    for text, label in zip(texts, labels):
# Original text
    augmented_texts.append(text)
    augmented_labels.append(label)
# Add punctuation symbol variations
tokenized = tokenizer(
        augmented_texts,
        padding="max_length",
        truncation=True,
        max_length=128
    )

    # Add labels
    tokenized["labels"] = augmented_labels
    return tokenized

tokenized_dataset = dataset.map(
    tokenize_function,
    batched=True,
    remove_columns=dataset["train"].column_names
)

# Add data verification before training
print("Size of training set:", len(tokenized_dataset["train"]))
print("Size of validation set:", len(tokenized_dataset["validation"]))

# Check the structure of the dataset
print("Fields of the dataset:", tokenized_dataset["train"].features)

# Ensure that the labels are within the correct range
assert all(0 <= label <= 2 for label in dataset["train"]["label"]), "Label value is out of the expected range"

# 6. Training parameters
training_args = TrainingArguments(
    output_dir="./results",
    num_train_epochs=10,
    per_device_train_batch_size=8,    # Adjust batch size
    per_device_eval_batch_size=8,
    warmup_steps=100,
    weight_decay=0.02,
    logging_dir="./logs",
    logging_steps=10,
    evaluation_strategy="steps",
    save_strategy="steps",
    eval_steps=50,
    save_steps=50,
    load_best_model_at_end=True,
    learning_rate=1e-5,
    save_total_limit=2,
    metric_for_best_model="accuracy",
    gradient_accumulation_steps=2
)

def compute_metrics(pred):
    labels = pred.label_ids
    preds = pred.predictions.argmax(-1)
    precision, recall, f1, _ = precision_recall_fscore_support(labels, preds, average='weighted')
    acc = accuracy_score(labels, preds)
    return {
        'accuracy': acc,
        'f1': f1,
        'precision': precision,
        'recall': recall
    }

# 7. Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset["train"],
    eval_dataset=tokenized_dataset["validation"],
    compute_metrics=compute_metrics  # Add evaluation metrics
)

# 8. Train the model
trainer.train()

# 9. Save the model and tokenizer
model_save_path = "./emotion_model"
tokenizer.save_pretrained(model_save_path)  # Save the tokenizer
trainer.save_model(model_save_path)         # Save the model

# 10. Save the label mapping
import json
label_map = {str(v): k for k, v in enumerate(dataset["train"]["label"].unique())}
with open('label_map.json', 'w') as f:
    json.dump(label_map, f)
\end{minted}

\section{Pseudocode Example}
\begin{algorithm}[h!]
\caption{Emotion Analysis Model Training Process}

\State \textbf{Input:} Labeled emotional text dataset
\State \textbf{Output:} Trained emotion classification model

\State \textbf{Load Environment Variables} \Comment{Load environment variables}
\State Call load\_dotenv()

\State \textbf{Load Configuration} \Comment{Load configuration file}
\State $\text{config} \leftarrow \text{Load JSON from 'config.json'}$

\State \textbf{Initialize Model} \Comment{Set up model parameters}
\State model\_name $\leftarrow$ config['model\_name']
\State model\_save\_path $\leftarrow$ config['model\_save\_path']

\State \textbf{Prepare Data} \Comment{Initialize data structures}
\State emotion\_data $\leftarrow$ [] \Comment{Initialize empty list}
\State label\_dict $\leftarrow$ \{Happy: 0, Angry: 1, Sad: 2\}

\For{each item in emotion\_data}
    \State item.label $\leftarrow$ label\_dict[item.label]
\EndFor

\State \textbf{Split Dataset} \Comment{Create train/validation sets}
\State Set random seed to 42
\State Split data into train (80\%) and validation (20\%)

\State \textbf{Load Model} \Comment{Initialize BERT model}
\Try
    \State Load BERT tokenizer and model
\Catch
    \State Load fallback model
\EndTry

\State \textbf{Train Model} \Comment{Execute training process}
\State Set training parameters
\State Train model with data
\State Evaluate performance

\State \textbf{Save Results} \Comment{Store trained model}
\State Save model and tokenizer
\State Save label mapping

\end{algorithm}

\section{Conclusion}
About the Importance and Value of Sentiment Detection
\subsection{Text sentiment detection (also called sentiment analysis) plays an important role in many fields. For example, it can help companies understand the emotional state of customers in real time by analyzing customer feedback, social media comments, etc., thereby improving customer experience, enhancing market insights, helping mental health support, conducting social media monitoring, optimizing content recommendation systems, responding to crisis management, and promoting the development of natural language processing technology. It has broad application potential and important value, and with the advancement of technology, its accuracy and application scope are expected to continue to expand.}

Relationship with artificial intelligence and comparison of different methods

\subsection{Relationship: Text sentiment detection is closely related to artificial intelligence. Natural language processing technology in artificial intelligence can help understand text semantics and emotions. Machine learning and deep learning algorithms can be used to train models to achieve sentiment classification, and can analyze data and provide real-time feedback to assist decision-making.}

Method comparison: Different AI methods for text sentiment prediction have their own advantages and disadvantages.

\subsection{Natural language processing methods are simple to implement and highly interpretable, but they have sparse features and lack of contextual understanding; machine learning methods are efficient and flexible, but rely on manual feature engineering and have poor adaptability to large-scale data; deep learning methods (such as RNN, LSTM, etc.) can capture strong context and automatically learn features, but they require high computing resources and have poor interpretability; pre-trained models (such as BERT, GPT, etc.) have high accuracy and transfer learning capabilities, but they consume a lot of resources and have large model sizes; multimodal learning can integrate information sources and improve accuracy, but it is highly complex and requires a lot of multimodal annotated data. It is necessary to select the appropriate method based on comprehensive considerations such as specific application scenarios, data scale, and resource constraints. Deep learning and multimodal learning may have more advantages in complex scenarios, and traditional machine learning methods and basic natural language processing methods may be more appropriate in resource-constrained situations.}

Practice-related demonstration
\subsection{The article provides Python code examples (such as sentiment classification model-related operations based on Transformer, BERT, etc., covering data preparation, model and word segmentation acquisition, data preprocessing, training parameter setting, model training and saving, etc.) and pseudocode examples (such as the Fibonacci sequence algorithm example), presenting the application of related technologies from a practical perspective, providing an important reference for the future development of sentiment detection, and demonstrating the great potential of artificial intelligence in understanding and responding to human emotions.
}



\bibliographystyle{IEEEtran}
\bibliography{ref}
\noindent
[1].Koroteev, M. V. (2021). BERT: a review of applications in natural language processing and understanding. arXiv preprint arXiv:2103.11943.\\
\noindent
[2].Jawahar, G., Sagot, B., & Seddah, D. (2019, July). What does BERT learn about the structure of language?. In ACL 2019-57th Annual Meeting of the Association for Computational Linguistics.\\
\noindent
[3].Hao, Y., Dong, L., Wei, F., & Xu, K. (2019). Visualizing and understanding the effectiveness of BERT. arXiv preprint arXiv:1908.05620.\\
\noindent
[4].Zhou, C., Li, Q., Li, C., Yu, J., Liu, Y., Wang, G., ... & Sun, L. (2024). A comprehensive survey on pretrained foundation models: A history from bert to chatgpt. International Journal of Machine Learning and Cybernetics, 1-65.\\
\noindent
[5].Rogers, A., Kovaleva, O., & Rumshisky, A. (2021). A primer in BERTology: What we know about how BERT works. Transactions of the Association for Computational Linguistics, 8, 842-866.\\
\noindent
[6].Ding, M., Zhou, C., Yang, H., & Tang, J. (2020). Cogltx: Applying bert to long texts. Advances in Neural Information Processing Systems, 33, 12792-12804.\\
\noindent
[7].Han, K., Xiao, A., Wu, E., Guo, J., Xu, C., & Wang, Y. (2021). Transformer in transformer. Advances in neural information processing systems, 34, 15908-15919.\\
\noindent
[8].Zhao, H., Jiang, L., Jia, J., Torr, P. H., & Koltun, V. (2021). Point transformer. In Proceedings of the IEEE/CVF international conference on computer vision (pp. 16259-16268).\\
\noindent
[9].Lian, Z., Liu, B., & Tao, J. (2021). CTNet: Conversational transformer network for emotion recognition. IEEE/ACM Transactions on Audio, Speech, and Language Processing, 29, 985-1000.\\
\noindent
[10].Wagner, J., Triantafyllopoulos, A., Wierstorf, H., Schmitt, M., Burkhardt, F., Eyben, F., & Schuller, B. W. (2023). Dawn of the transformer era in speech emotion recognition: closing the valence gap. IEEE Transactions on Pattern Analysis and Machine Intelligence, 45(9), 10745-10759.\\
\noindent
[11].Ju, X., Zhang, D., Li, J., & Zhou, G. (2020, October). Transformer-based label set generation for multi-modal multi-label emotion detection. In Proceedings of the 28th ACM international conference on multimedia (pp. 512-520).
\end{document}
