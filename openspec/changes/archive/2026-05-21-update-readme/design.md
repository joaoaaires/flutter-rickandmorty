## Context

O projeto é um app Flutter que consome a Rick and Morty API, usando Clean Architecture com GetX. O README atual tem apenas 5 linhas e um GIF. Novos contribuidores não têm como entender a estrutura sem ler todo o código.

## Goals / Non-Goals

**Goals:**
- Documentar a arquitetura Clean Architecture (data/domain/presentation) com GetX
- Listar features implementadas (Character, Episode, Location)
- Fornecer instruções claras de setup e execução
- Documentar dependências e suas finalidades
- Manter o GIF demonstrativo existente

**Non-Goals:**
- Não criar documentação separada (wiki, docs/)
- Não adicionar badges de CI/CD (não existe pipeline configurado)
- Não documentar a API em si (já existe documentação oficial)
- Não traduzir para múltiplos idiomas

## Decisions

1. **Idioma: Inglês** — O README atual está em inglês, o código está em inglês, e é o padrão para projetos open-source no GitHub.

2. **Estrutura do README em seções claras** — Usar headers markdown (H2) para: Overview, Demo, Architecture, Project Structure, Features, Dependencies, Getting Started, API Reference. Facilita navegação e leitura rápida.

3. **Diagrama de pastas em texto** — Usar bloco de código com tree simplificado ao invés de imagem. Mais fácil de manter e acessível.

4. **Manter GIF existente** — O GIF já hospedado no GitHub user-content funciona e demonstra o app visualmente.

## Risks / Trade-offs

- [README pode ficar desatualizado] → Manter seções genéricas o suficiente para não quebrar com mudanças menores. Focar em arquitetura (estável) ao invés de detalhes de implementação (voláteis).
- [GIF pode ficar indisponível] → Está hospedado no GitHub user-content, risco baixo. Não há ação necessária agora.
