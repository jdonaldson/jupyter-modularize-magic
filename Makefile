.PHONY: help setup install test clean build publish

help:
	@echo "Available commands:"
	@echo "  make setup    - Set up the development environment"
	@echo "  make install  - Install the package in editable mode"
	@echo "  make test     - Run the test suite"
	@echo "  make clean    - Remove build artifacts"
	@echo "  make build    - Build source and wheel package"
	@echo "  make publish  - Publish the package to PyPI"

setup:
	python -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

install:
	pip install -e .

test:
	pytest

clean:
	rm -rf build dist *.egg-info
	find . -type d -name "__pycache__" -exec rm -rf {} +

build: clean
	python -m build

publish: build
	twine check dist/*
	twine upload dist/*