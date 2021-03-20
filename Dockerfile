FROM python:3.9 AS build
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.9-slim
WORKDIR /foaas
COPY --from=build /root/.local /root/.local
EXPOSE 5000
COPY ./*.py /foaas
ENV PATH=/root/.local:$PATH
CMD [ "python", "foaas.py" ]