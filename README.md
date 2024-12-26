# Projeto: LocationTrackerDB

Este projeto contém a estrutura de um banco de dados SQLite para armazenar informações de dispositivos, localizações capturadas periodicamente e logs de sincronização. O banco foi criado e gerenciado utilizando a ferramenta **DB Browser for SQLite**.

---

## 📋 Estrutura do Banco de Dados

O banco de dados **LocationTrackerDB** possui três tabelas principais:

### 1. **Devices**
Armazena informações dos dispositivos que capturam e enviam dados de localização.
- **Campos:**
  - `id_device` (INTEGER, PK): Identificador único do dispositivo.
  - `hostname` (TEXT): Nome do host do dispositivo.
  - `ip_address` (TEXT): Endereço IP do dispositivo.

### 2. **Locations**
Registra os dados de localização capturados pelos dispositivos.
- **Campos:**
  - `id_location` (INTEGER, PK): Identificador único do registro de localização.
  - `id_device` (INTEGER, FK): Referência ao dispositivo (`Devices.id_device`).
  - `latitude` (REAL): Latitude da localização.
  - `longitude` (REAL): Longitude da localização.
  - `datetime_captured` (TEXT): Data e hora da captura.
  - `ping_status` (TEXT): Status do ping (`success`, `failure`, etc.).
  - `saved_local` (INTEGER): Indica se os dados foram armazenados localmente (0 = Não, 1 = Sim).

### 3. **SyncLogs**
Registra logs das sincronizações entre o banco local e o servidor.
- **Campos:**
  - `id_sync` (INTEGER, PK): Identificador único do log.
  - `id_device` (INTEGER, FK): Referência ao dispositivo (`Devices.id_device`).
  - `datetime_synced` (TEXT): Data e hora da sincronização.
  - `status` (TEXT): Status da sincronização (`success`, `failure`).
  - `num_records_synced` (INTEGER): Número de registros sincronizados.

---

## 🚀 Como Utilizar o Banco de Dados

### 1. Instalar o DB Browser for SQLite
- Baixe a ferramenta do site oficial: [DB Browser for SQLite](https://sqlitebrowser.org/).
- Instale conforme as instruções para o seu sistema operacional.

### 2. Abrir o Banco de Dados
1. Abra o **DB Browser for SQLite**.
2. Clique em **File > Open Database**.
3. Selecione o arquivo `LocationTrackerDB.db`.

### 3. Executar Consultas
- Na aba **Execute SQL**, você pode rodar consultas para interagir com o banco. Exemplo:
  ```sql
  SELECT * FROM Devices;
  SELECT * FROM Locations WHERE id_device = 1;
