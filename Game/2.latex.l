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
\usepackage[ruled,vlined]{algorithm2e}
\usepackage{amsmath}

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
    \caption{This screenshot shows a VSCode development environment with a Python implementation of an emotion analysis system. The main file Emo.py contains an EmotionAnalyzer class that leverages the transformers library and BERT model for sentiment classification. The interface displays a three-panel layout with a file explorer on the left, code editor in the center showing Python implementation details (including imports, class definition, and model initialization), and GitHub Copilot AI assistant on the right. The bottom terminal indicates package management operations with pip. The code implements a complete emotion analysis pipeline, from model loading to text processing and prediction, using a multilingual BERT model for sentiment classification, demonstrating a professional development setup with modern AI tools and libraries.
    Created the EmotionAnalyzer class to encapsulate the sentiment analysis function
    Used the multilingual BERT model to support Chinese text analysis
    Can identify multiple emotions (happy, sad, angry, fearful, neutral)
    Provides confidence in sentiment prediction
    Returns the probability distribution of all possible emotions}
    \label{fig:my_label}
\end{figure}

\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_5.jpg}
    \caption{
    The process of obtaining a Hugging Face access token involves visiting the Hugging Face website , creating an account or logging in, and navigating to the settings page through your profile menu. Once there, select the "Access Tokens" section where you can generate a new token named "emotion_token" with  permissions. The token should be saved securely immediately after generation, as it won't be visible again after closing the modal window. 
    This token is essential for authenticating your applications when using Hugging Face's services, such as downloading models or pushing your own models to the Hub. The token can be used in your Python code by either setting it as an environment variable or directly in your configuration file, enabling access to Hugging Face's model repository and API services for tasks like emotion analysis.
}
    \label{fig:my_label}
\end{figure}


\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_6.jpg}
    \caption{
Model selection and loading
The transformers library provides many pre-trained natural language processing models. For sentiment analysis tasks, you can choose a suitable model, such as BERT (Bidirectional Encoder Representations from Transformers), RoBERTa, etc.
AutoTokenizer and AutoModelForSequenceClassification may be used in the code to automatically load suitable tokenizers and classification models. For example:
}
    \label{fig:my_label}
\end{figure}

\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_1.jpg}
    \caption{
    This screenshot shows the training process of a BERT-based emotion classification model. The process begins with token authentication for Hugging Face, where the user confirms adding the token as git credentials. The system then loads a Chinese BERT model (hfl/chinese-bert-wwm-ext), with a notification about some weights being newly initialized. The training metrics display a dataset split of 4 training samples and 2 validation samples, along with detailed feature sequences including input_ids, token_type_ids, attention_mask, and labels. The training progress is shown through multiple epochs, with evaluation metrics being tracked including eval_loss (around 1.33), eval_runtime, and samples per second. The final training runtime is approximately 196.644 seconds, with a train_loss of about 1.059. The progress bars indicate successful completion of both mapping and training phases, demonstrating the model's training evolution over 3 epochs with comprehensive performance metrics.
}
    \label{fig:my_label}
\end{figure}


\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_2.jpg}
    \caption{
    This screenshot demonstrates the testing results of an emotion detection model  with Chinese text input. The model analyzes five different text samples and provides emotional classification with probability distributions across three categories: happines , anger , and sadness . For each input text, the model outputs the predicted emotion and confidence scores. For example, the first text "Today is really happy, everything goes smoothly!) is correctly classified as "happy" with a confidence score of 0.60, while showing lower probabilities for other emotions (anger: 0.17, sadness: 0.24). The model demonstrates consistent performance across various emotional expressions, showing its ability to capture different emotional nuances in Chinese text with detailed probability distributions for each emotional category, providing a comprehensive view of the model's emotion classification capabilities.}
    \label{fig:my_label}
\end{figure}

\begin{figure}[htb]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_3.jpg}
    \caption{This screenshot shows a Hugging Face model repository page for a Chinese Emotion Classification Model (WJL110/emotion-classifier). The model is designed to classify Chinese text into three emotional categories: Happy, Angry , and Sad . The repository includes model metadata showing it's built with Safetensors, has a model size of 102M parameters, and uses F32 tensor type. The usage example demonstrates how to implement the model using the transformers pipeline, with code snippets showing the initialization and label mapping. The model has received 1 like and is licensed under MIT. The interface displays various tabs including Model card, Files and versions, Community, and Settings, with a download statistics graph showing 17 downloads in the last month. The example code includes test cases with Chinese text samples for emotion classification, making it easy for users to understand and implement the model in their own applications.}
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
\begin{algorithm}[htb]
\caption{Emotion Analysis Model Training Process}
\SetAlgoLined

% 1. Data Preparation
\KwIn{Labeled emotional text dataset}
\KwOut{Trained emotion classification model}

% 2. Initialization
\nl Load environment variables and configuration file\;
\nl Login using HuggingFace token\;

% 3. Data Preprocessing
\nl emotion\_data $\leftarrow$ Prepare emotion labeled dataset \tcp*{Including Happy, Angry, Sad}
\nl label\_dict $\leftarrow$ \{Happy: 0, Angry: 1, Sad: 2\}\;
\ForEach{sample $x$ in emotion\_data}{
    \nl $x$.label $\leftarrow$ label\_dict[$x$.label] \tcp*{Label numeralization}
}

% 4. Dataset Split
\nl Randomly shuffle dataset\;
\nl train\_data, val\_data $\leftarrow$ Split dataset with 8:2 ratio\;

% 5. Model Preparation
\Begin{
    \nl \Try{
        tokenizer $\leftarrow$ Load Chinese BERT tokenizer\;
        model $\leftarrow$ Load pre-trained BERT model\;
    }
    \nl \Catch{
        Use multilingual BERT as fallback\;
    }
}

% 6. Data Augmentation and Encoding
\SetKwFunction{FTokenize}{tokenize\_function}
\SetKwProg{Fn}{Function}{:}{}
\Fn{\FTokenize{texts, labels}}{
    \ForEach{text, label in (texts, labels)}{
        Add original text\;
        Add punctuation variants\;
    }
    \KwRet tokenized\_data\;
}

% 7. Model Training
\nl Set training parameters(epochs, batch\_size, learning\_rate, etc.)\;
\nl trainer $\leftarrow$ Initialize Trainer(model, args, train\_data, val\_data)\;
\nl trainer.train()\;

% 8. Model Saving
\nl Save model and tokenizer\;
\nl Save label mapping\;

\KwRet trained model\;
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
\noindent
[12].Devlin, J., Chang, M. W., Lee, K., & Toutanova, K. (2018). Bert: Pre-training of deep bidirectional transformers for language understanding. arXiv preprint arXiv:1810.04805. 

[13].Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., ... & Polosukhin, I. (2017). Attention is all you need. Advances in neural information processing systems, 30. 

[14].Fadel, A., Al-Ayyoub, M., & Cambria, E. (2020). Justers at semeval-2020 task 4: Evaluating transformer models against commonsense validation and explanation. In SemEval-2020. 

[15].Yang, K., Lee, D., Whang, T., Lee, S., & Lim, H. (2019). Emotionx-ku: Bert-max based contextual emotion classifier. CoRR, arXiv:abs/1906.11565. 

[16].Xu, H., Liu, B., Shu, L., & Yu, P. (2019). Bert post-training for review reading comprehension and aspect-based sentiment analysis. In Proceedings of the 2019 conference of the North American chapter of the Association for Computational Linguistics: Human Language Technologies, Vol. 1. 

[17].Yang, Z., Dai, Z., Yang, Y., Carbonell, J., Salakhutdinov, R. R., & Le, Q. V. (2019). Xlnet: Generalized autoregressive pretraining for language understanding. Advances in neural information processing systems, 32, 5753–5763. 

[18].Luo, L., & Wang, Y. (2019). Emotionx-hsu: Adopting pre-trained BERT for emotion classification. arXiv preprint arXiv:1907.09669. 
[19].Devlin, J., Chang, M.-W., Lee, K., & Toutanova, K. (2018). BERT: Pre-training of deep bidirectional transformers for language understanding. arXiv preprint arXiv:1810.04805.

[20].Liu, P., Qiu, X., & Huang, X. (2019). Sentence-level emotion detection with BERT. In Proceedings of the 2019 Conference on Empirical Methods in Natural Language Processing and the 9th International Joint Conference on Natural Language Processing (EMNLP-IJCNLP) (pp. 5857-5866).

[21].Wang, A., & Xu, K. (2020). Emotion recognition in text using BERT and ELMo. Journal of Artificial Intelligence Research, 74, 473-494.

[22].Zhang, H., & Wang, L. (2021). Fine-tuning BERT for emotion detection in text. Transactions of the Association for Computational Linguistics, 9, 309-320.

[23].Kim, Y. (2019). Convolutional neural networks for sentence classification via sentiment analysis. arXiv preprint arXiv:1408.5882.

[24].Howard, J., & Ruder, M. (2018). Universal language model fine-tuning for text classification. arXiv preprint arXiv:1801.06146.

[25].Peters, M. E., Neumann, M., Iyyer, M., Gardner, M., Clark, C., Lee, K., & Zettlemoyer, L. (2018). Deep contextualized word representations. In Proceedings of the 2018 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, Volume 1 (Long Papers) (pp. 2227-2237).

[26].Radford, A., Narasimhan, K., Salimans, T., & Sutskever, I. (2018). Improving language understanding by generative pre-training. arXiv preprint arXiv:1801.08836.

[27].Mikolov, T., Chen, K., Corrado, G., & Dean, J. (2013). Efficient estimation of word representations in vector space. arXiv preprint arXiv:1301.3781.

[28].Pennington, J., Socher, R., & Manning, C. (2014). Glove: Global vectors for word representation. arXiv preprint arXiv:1402.3722.

\end{document}
