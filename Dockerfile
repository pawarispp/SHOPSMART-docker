FROM jupyter/scipy-notebook

# Install necessary packages
RUN pip install pandas SQLAlchemy psycopg2-binary

# Copy the notebook into the container
COPY etl_pipeline.ipynb /home/jovyan/work/

# Copy data files into the container
COPY data/ /home/jovyan/work/data/
