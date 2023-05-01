# Import the FastAPI class from the fastapi module.
from fastapi import FastAPI

# Declare an instance of the FastAPI class.
app = FastAPI()

# use the app instance as a decorator to handle an 
# HTTP route and HTTP method.
@app.get("/")
def read_index():
    """
    Return a Python Dictionary that supports JSON serialization.
    """
    return {"Hello": "World"}
