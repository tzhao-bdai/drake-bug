# Minimal reproduction of an interesting bug

Steps to reproduce:
1. Create a virtual env with `python3 -m venv env` (tested with Python 3.10.12)
2. Activate the environment with `source env/bin/bash`
3. Install the dependencies with `pip install -r requirements.txt`
4. Reproduce the bug with `python3 bug.py`. It will segfault.

