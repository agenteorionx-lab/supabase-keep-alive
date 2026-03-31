# Supabase Keep Alive (Multi-Projeto)

Este repositório contém uma automação simples para evitar que seus projetos do Supabase (plano gratuito) entrem em modo de pausa por inatividade.

## Como funciona?
O GitHub Actions dispara uma requisição HTTP para cada um dos seus 4 projetos a cada **5 dias**. Essa pequena operação mantém o banco de dados ativo.

---

## Passos para Configuração

### 1. No Supabase (Cada Projeto)
Vá em cada um dos seus 4 projetos e execute o conteúdo do arquivo `setup_database.sql` no **SQL Editor**. Isso criará a tabela `heartbeat`.

### 2. No GitHub (Este Repositório)
Vá em **Settings > Secrets and variables > Actions > New repository secret** e adicione as seguintes chaves para cada projeto:

| Secret Name | Onde encontrar no Supabase |
| :--- | :--- |
| `SUPABASE_URL_X` | Project Settings > API > Project URL |
| `SUPABASE_SERVICE_ROLE_KEY_X` | Project Settings > API > `service_role` key (não a `anon`) |

*Substitua o **X** pelo número do projeto (1, 2, 3 ou 4).*

### 3. Teste Manual
Após configurar os Secrets, vá na aba **Actions** no topo do repositório, selecione o workflow **Supabase Multi-Project Keep Alive** e clique em **Run workflow**. Isso testará a conexão com todos os projetos imediatamente.

---

## Estrutura do Repositório
- `.github/workflows/keep-alive.yml`: O script da automação.
- `setup_database.sql`: Script SQL para preparar o banco de dados.
