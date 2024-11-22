from fastapi import FastAPI, Request, Form
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
import json
import os
from autogen_magentic_one.interface.magentic_one_helper import MagenticOneHelper

app = FastAPI()

# Mount static files
app.mount("/static", StaticFiles(directory="app/static"), name="static")

# Templates
templates = Jinja2Templates(directory="app/templates")

# Initialize MagenticOne helper
def init_magnetic_one():
    # Create logs directory if it doesn't exist
    os.makedirs("logs", exist_ok=True)
    
    return MagenticOneHelper(
        logs_dir="logs",
        save_screenshots=True
    )

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse(
        "index.html",
        {"request": request}
    )

@app.post("/execute")
async def execute_task(request: Request, task: str = Form(...)):
    helper = init_magnetic_one()
    
    # Execute the task
    try:
        result = helper.execute_task(task)
        return {"status": "success", "result": result}
    except Exception as e:
        return {"status": "error", "message": str(e)}
