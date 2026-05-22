## Context

O README.md atual está completo em inglês. O projeto precisa de uma versão PT-BR para atender desenvolvedores brasileiros. O arquivo será independente para evitar conflitos de manutenção.

## Goals / Non-Goals

**Goals:**
- Criar `README.pt-br.md` com tradução completa e natural (não literal)
- Manter mesma estrutura de seções do README em inglês
- Adicionar link de navegação entre as versões

**Non-Goals:**
- Não usar sistema de i18n automatizado
- Não traduzir termos técnicos consagrados (Clean Architecture, GetX, etc.)
- Não alterar conteúdo técnico — apenas traduzir

## Decisions

1. **Arquivo separado (`README.pt-br.md`)** — Padrão usado em projetos open-source para múltiplos idiomas. Alternativa descartada: README único com toggle (complexo, não suportado nativamente pelo GitHub).

2. **Link no topo do README.md** — Adicionar badge/link "🇧🇷 Português" no início do README inglês, e "🇺🇸 English" no início do PT-BR. Padrão comum e não-intrusivo.

3. **Manter termos técnicos em inglês** — Termos como "Clean Architecture", "state management", nomes de pacotes e comandos CLI permanecem em inglês por serem universais.

## Risks / Trade-offs

- [Dessincronia entre versões] → Risco aceito. Documentação é estável e muda raramente. Manter nota no PR sobre atualizar ambos.
