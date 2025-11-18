# Sistema Simples de Consentimento (LGPD) - app-desafio

## Descrição
Pequeno sistema em Ruby on Rails para gerenciar consentimentos por finalidade (marketing, analytics, newsletter). Cada finalidade é controlada separadamente; o sistema registra quando o consentimento foi concedido e quando foi revogado.

## Requisitos
- Ruby (>= 3.1 recomendado)
- Rails (versão usada no projeto)
- SQLite3
- Bundler

## Como rodar localmente

1. Clone o repositório ou copie os arquivos para uma pasta
```bash
git clone https://github.com/Henrique-All/app-desafio
cd app-desafio
```

2. Instale dependências
```bash
bundle install
```

3. Prepare o banco de dados (migrations + seeds)
```bash
bundle exec rails db:setup
```

4. Inicie o servidor
```bash
bundle exec rails server -b 0.0.0.0
```

5. Acesse no navegador
- Criar usuário: http://localhost:3000/
- Listar usuários: http://localhost:3000/users
- Gerenciar consentimentos: http://localhost:3000/users/1/consents

## Rotas principais
- GET /users
- GET /users/new
- POST /users
- GET /users/:user_id/consents
- PATCH /users/:user_id/consents/:purpose?action_type=grant|revoke

## Modelagem
- User: name, email
- Consent: user_id, purpose, granted, granted_at, revoked_at

## Regras de negócio
- Consentimento por finalidade
- Registro único por usuário + finalidade
- Conceder: granted=true, granted_at=agora, revoked_at=nil
- Revogar: granted=false, revoked_at=agora

## Seeds
- Dois usuários de exemplo criados no seeds.rb

## Troubleshooting
- Problemas com config/boot.rb: recrie app ou restaure arquivos config
- Permissões no WSL: evite /mnt/c, use filesystem do WSL ou habilite metadata
- Migrations: nomes válidos, sem duplicatas, sem sudo
- Links não enviam PATCH: use button_to ou data-turbo-method

## Melhorias futuras
- Autenticação (Devise)
- API JSON
- Histórico completo
- Testes automatizados
- Docker e deploy


Obrigado!
