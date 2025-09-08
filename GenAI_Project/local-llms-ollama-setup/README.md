# local-llms-ollama-setup

This folder contains instructions and resources for setting up local Large Language Models (LLMs) using Ollama.

## Overview
- Ollama enables running open-source LLMs locally for development, experimentation, and integration.

## Getting Started
1. Install Ollama on your system (see https://ollama.com/download).
2. Follow setup instructions for your preferred LLM model.
3. Add scripts, configuration files, and notes in this folder as needed.

Prerequisites:
Installing Ollama:
1. Download and Install Ollama
https://ollama.com/download/windows
Download and install the .exe file from above link

Once successfully installed Ollama application. You can able to view the Ollama prompt window

2. Open Git Bash terminal and pull the Ollama model
ollama pull llama3.2:1b

Project Setup:
We need python to setup project environment. If you don't have python in your machine. Please install it and follow next steps.

1. Create Virtual Environment
python3 -m venv venv			==> Don't try to run this command in the C disk. You ca nrun this command in any desire folder you want.

2. Activate the virtual environment
./venv/Scripts/activate  # On Windows

3. Install Ollama Dependencies to run the python script
pip3 install ollama

4. Write the Python script to generate dockerfile for any language as you wish

5. Run the Application
python3 generate_dockerfile.py


How It Works!.
1. The script takes a programming language as input (e.g., Python, Node.js, Java)
2. Connects to the Ollama API running locally
3. Generates an optimized Dockerfile with best practices for the specified language
4. Returns the Dockerfile content with explanatory comments

Example Usage:
python3 generate_dockerfile.py
	Enter programming language: python
	# Generated Dockerfile will be displayed...
	
Troubleshooting:
Make sure Ollama service is running before executing the script.
Ensure the correct model is downloaded.
Adapt best practices for other programming languages as needed.
