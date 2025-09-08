Dockerfile Generator
A GenAI powered tool that generates optimized Dockerfiles based on programming language input. This project uses Ollama with the Llama3 model to create Dockerfiles following best practices.

1. Write the Python script to generate dockerfile for any language as you wish

2. Run the Application
python3 generate_dockerfile.py


How It Works!
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
