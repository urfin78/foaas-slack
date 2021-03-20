FROM python:3.9
WORKDIR /foaas
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY ./*.py /foaas
EXPOSE 5000
CMD [ "python", "foaas.py" ]