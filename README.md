Configurando Samba com Variáveis de Ambiente no Coolify
Para configurar o servidor Samba usando variáveis de ambiente do Coolify (para usuário e senha), siga estes passos:

1. Configuração no Coolify
Adicione estas variáveis de ambiente no painel do Coolify:
Vá para seu projeto no Coolify

Acesse "Environment Variables" (Variáveis de Ambiente)

Adicione:

SAMBA_USER - Nome de usuário para acesso

SAMBA_PASSWORD - Senha segura para acesso

SAMBA_SHARE_NAME - Nome do compartilhamento (opcional)

2. Código Docker Compose
....
volumes:
  shared-data:
3. Como Funciona
O Coolify injeta as variáveis SAMBA_USER e SAMBA_PASSWORD no container

O container Samba usa essas credenciais para autenticação

Se SAMBA_SHARE_NAME não estiver definido, usa "Public" como padrão

4. Configuração Adicional no Coolify
Portas: Certifique-se que as portas 445, 139 e 137 estão liberadas

Persistência: O volume shared-data mantém os dados mesmo se o container for recriado

Segurança:

Nunca comite senhas no código

Use apenas as variáveis de ambiente do Coolify

Considere restringir acesso por IP no firewall

5. Como Atualizar Credenciais
Altere as variáveis no painel do Coolify

Reinicie o serviço Samba

Precisa de alguma adaptação adicional nesta configuração?

