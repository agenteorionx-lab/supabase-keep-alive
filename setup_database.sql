-- CÓDIGO SQL PARA EXECUTAR NO SUPABASE (SQL EDITOR)
-- Repita este processo para cada um dos 4 projetos.

-- 1. Cria a tabela de heartbeat se não existir
create table if not exists public.heartbeat (
  id int primary key default 1,
  last_ping timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- 2. Insere a primeira linha ou atualiza se já existir
insert into public.heartbeat (id, last_ping)
values (1, now())
on conflict (id) do update set last_ping = now(), updated_at = now();

-- 3. (Opcional) Verifique se a tabela foi criada
select * from public.heartbeat;
