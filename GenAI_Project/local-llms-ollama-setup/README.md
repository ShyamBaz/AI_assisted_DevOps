# local-llms-ollama-setup

This folder contains instructions and resources for setting up local Large Language Models (LLMs) using Ollama.

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