# Python resmi slim imajını kullan
FROM python:3.12-slim

# Gereksinimleri yüklemek için sistem güncellemeleri ve temel paketler
RUN apt-get update && \
    apt-get install -y python3-dev build-essential

# Pip'i güncelle
RUN pip install --upgrade pip

# Virtualenv kur ve sanal ortam oluştur
RUN pip install virtualenv && python -m virtualenv /opt/venv

# Sanal ortamı aktif et
ENV PATH="/opt/venv/bin:$PATH"

# Gereksinimleri yüklemek için requirements.txt dosyasını ekle
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Uygulama dosyalarını kopyala
COPY . /srv/app
WORKDIR /srv/app

# Django projesini çalıştırmak için ENTRYPOINT veya CMD kullan
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
