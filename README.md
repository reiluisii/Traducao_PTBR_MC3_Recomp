# Tradução PT-BR — Midnight Club 3: DUB Edition Remix (PC Recomp / Xrevive)

Tradução completa para **Português do Brasil (PT-BR)** para o porte de PC Recompilation do **Midnight Club 3: DUB Edition Remix**.

---

## 👥 Créditos
- **Tradução Original (PS2 Tradução V3):** `[refresh]`
- **Engenharia Reversa, Conversão de Tabelas, Localização Xbox/PC e Patch Gráfico de Fontes:** Engenharia Modding Recomp (2026)

---

## ✨ Recursos da Tradução para PC

1. **Localização Completa dos Menus, História e Carreira:**
   - Cidades de San Diego, Atlanta, Detroit e Tokyo com diálogos, corridas e biografias dos pilotos em português.
   - Textos de carregamento (*loading screens*) com todas as dicas e curiosidades automobilísticas traduzidas (610 strings).

2. **Suporte Total ao Mod MC3-VIP (28 Carros Adicionais):**
   - Tabela expandida com **10.996 strings** (em vez das 9.034 do jogo base).
   - Tradução de todas as peças de tuning, marcas de rodas, parachoques, saias laterais, escapamentos e aerofólios exclusivos do pacote VIP.
   - `vip-manifest.json` com integridade e hash SHA-256 recalculados para evitar qualquer mensagem de erro do executável (*resource hash mismatch*).

3. **Compatibilidade com o Mod MC3-HD-HUD:**
   - Texturas de fontes de 512x512 atualizadas com desenho do til (`~`) sobre os glifos de `ã` e `õ` mantendo o tamanho e formato exato exigido pelo runner.

4. **Botões e Controles Adaptados para Xbox / PC:**
   - Substituição de todas as referências de controles do PlayStation (X, Quadrado, Triângulo, Círculo, L1, R2, etc.) para os equivalentes do Xbox (A, B, X, Y, LB, RB, LT, RT, BACK, START).
   - Menus de salvamento atualizados para disco rígido (sem mensagens de "Memory Card (PS2)").

---

## 🚀 Como Instalar

### Opção 1: Instalação Automática (Recomendada)
1. Extraia o conteúdo deste pacote (ou copie a pasta `Traducao_PTBR_MC3_Recomp`) para dentro da pasta raiz do seu Midnight Club 3 no PC (onde se encontra o `xrevive.exe` ou `midnightclub3.exe`).
2. Execute o arquivo **`INSTALAR_TRADUCAO.bat`**.
3. O instalador copiará automaticamente os arquivos para suas pastas corretas e ativará o carregamento de arquivos externos (`loose_files=1`).
4. Inicie o jogo normalmente!

### Opção 2: Instalação Manual
1. Copie o conteúdo da pasta `extracted/` deste pacote para a pasta `extracted/` na raiz do seu jogo.
2. Caso use o mod **VIP**: copie a pasta `addons/mc3-vip/` deste pacote para a sua pasta `addons/mc3-vip/`.
3. Caso use o mod **HD-HUD**: copie a pasta `addons/mc3-hd-hud/` deste pacote para a sua pasta `addons/mc3-hd-hud/`.
4. No arquivo `SaveData/Midnight Club 3_ DUB edition/recomp-settings.dat`, confirme que a opção `loose_files=1` está ativada.

---

## 📂 Estrutura de Arquivos

```
Traducao_PTBR_MC3_Recomp/
├── INSTALAR_TRADUCAO.bat           # Instalador automático em 1 clique
├── LEIAME.txt                      # Guia em texto simples
├── README.md                       # Este guia
├── addons/
│   ├── mc3-hd-hud/
│   │   └── texture_x/              # Fontes HD 512x512 com til em ã/õ
│   │       ├── smallspace_05.tex
│   │       └── smallspace_05s.tex
│   └── mc3-vip/
│       ├── vip-manifest.json       # Manifesto com hash verificado
│       └── content/fonts/
│           └── mcstrings_x.strtbl  # Tabela com 10.996 strings em PT-BR
└── extracted/
    └── fonts/
        ├── mcloadstrings.strtbl    # Telas de carregamento em PT-BR
        ├── mcloadstrings_x.strtbl  # Telas de carregamento em PT-BR
        ├── mcstrings_x.strtbl      # Tabela base sem mod VIP em PT-BR
        └── texture_x/              # Fontes Stock 128x128 com til em ã/õ
            ├── smallspace_05.tex
            └── smallspace_05s.tex
```
