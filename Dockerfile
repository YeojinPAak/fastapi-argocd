#Dockerfile
FROM python:3.12-slim

# 작업 디렉토리 생성  도커 컨테이너 안에서 작업할 디렉토리(폴더)를 만든다 + 이동한다는 뜻
WORKDIR /app

# 종속성 복사 및 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install fastapi uvicorn

# 소스 복사
COPY . .

# Uvicorn 실행
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]