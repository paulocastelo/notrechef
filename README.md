# 🍽️ NotreChef – Gerenciador de Receitas

**NotreChef** é um aplicativo desenvolvido em **Flutter** com banco de dados local utilizando **Isar Database**.  
Seu objetivo é ajudar pessoas a organizarem suas receitas culinárias de forma simples, rápida e 100% offline, com backup, restauração local e agora também com sistema de temas personalizados e persistentes.

---

## 🚀 Funcionalidades

- ✅ Cadastro de receitas
- ✅ Cadastro de ingredientes associados às receitas
- ✅ Edição e exclusão de receitas
- ✅ Visualização detalhada de cada receita
- ✅ Backup dos dados em arquivo JSON
- ✅ Restauração dos dados a partir de um arquivo JSON
- ✅ Apagar todos os dados do banco local
- ✅ Alternância de tema (Notebook, Clean, Gourmet)
- ✅ Tema persistente salvo no banco de dados
- ✅ Suporte inicial a Dark Mode no tema Notebook
- ✅ Tela de Configurações para seleção de tema
- ✅ Tela de Sobre com links de apoio
- ✅ Operação 100% offline
- ✅ Interface gráfica responsiva com **Material 3 (Material You)**
- 🚀 Suporte para Android, Windows, Linux e macOS

---

## 🏗️ Arquitetura do Projeto

```plaintext
lib/
├── models/           # Modelos de dados (Receita, Ingrediente, AppConfig)
├── services/         # Serviços (IsarService, ReceitaService, BackupService, ConfigService)
├── themes/           # Sistema de temas (AppThemes, ThemeManager, ThemeTokens)
├── ui/
│   ├── pages/        # Telas do app (Home, Formulário, Detalhe, Configurações, Sobre)
│   └── widgets/      # Componentes reutilizáveis (cards, botões, etc.)
├── utils/            # Extensões e funções auxiliares (tratamento de strings, listas, etc.)
└── main.dart         # Ponto de entrada do app
````

---

## 🗄️ Banco de Dados

* **Banco local:** Isar Database (NoSQL, extremamente rápido e orientado a objetos)
* **Modelos principais:**

  * **Receita:** Entidade principal com nome, descrição, categoria, tempo de preparo, rendimento, modo de preparo e lista de ingredientes.
  * **Ingrediente:** Entidade embutida na Receita.
  * **AppConfig:** Armazena configurações do app, como tema selecionado e status de Dark Mode.

---

## 🎨 Sistema de Temas

* Suporte a múltiplos temas:

  * 🎨 **Notebook** – Tema padrão (inspirado em caderno de receitas)
  * ⚪ **Clean** – Tema branco, minimalista
  * ⚫ **Gourmet** – Tema elegante, preto e dourado
* Suporte a Dark Mode no tema Notebook
* Persistência do tema e preferências no banco de dados (Isar)
* Gerenciado pela classe `ThemeManager` e pelo serviço `ConfigService`

---

## ⚙️ Tecnologias e Dependências

* **Framework:** Flutter
* **Linguagem:** Dart
* **Banco Local:** Isar Database
* **Gerenciamento de arquivos:** path\_provider
* **Serialização:** json\_annotation + json\_serializable
* **Geradores:** build\_runner + isar\_generator
* **Navegação:** Navigator padrão do Flutter
* **Tema:** Material 3 (Material You) + Sistema de Temas Personalizados
* **Abrir links externos:** url\_launcher
* **Gerenciamento de estado:** Provider (para temas) + StatefulWidget (demais telas, fase inicial)
* **Validações:** Nativas do Flutter (`Form` + `TextFormField`)

---

## 🛠️ Como Rodar o Projeto

### 1️⃣ Clone o repositório:

```bash
git clone https://github.com/seu-usuario/notrechef.git
cd notrechef
```

### 2️⃣ Instale as dependências:

```bash
flutter pub get
```

### 3️⃣ Gere os arquivos auxiliares (Isar e JSON Serializable):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4️⃣ Execute o projeto:

✔️ Android → Emulador ou dispositivo físico
✔️ Desktop → Windows, macOS ou Linux

🚫 **Atenção:** O Isar **não funciona no Flutter Web**, devido à limitação de inteiros 64-bit no JavaScript.

---

## 🔥 Observação Importante para Windows

Se estiver rodando no **Windows Desktop**, ative o **Developer Mode**, necessário para suporte a symlink:

Vá até:
**Configurações → Privacidade e Segurança → Para Desenvolvedores → Ativar modo desenvolvedor**

Ou execute no terminal:

```bash
start ms-settings:developers
```

---

## 💾 Local dos arquivos de backup

O backup é salvo no diretório de documentos do app:

* 📍 **Android / Desktop:**
  `/data/user/0/com.seuprojeto/app_flutter/notrechef_backup.json`

---

## 📅 Roadmap

* ✅ Modelagem das entidades
* ✅ CRUD completo (Receitas e Ingredientes)
* ✅ Backup e restauração via JSON
* ✅ Serviço para apagar todos os dados
* ✅ Tela inicial (Home)
* ✅ Formulário de criação e edição de receitas
* ✅ Tela de detalhes da receita
* ✅ Tela de configurações com seletor de tema
* ✅ Tela de sobre o app com links de apoio
* ✅ Alternância de tema (Notebook, Clean, Gourmet) com persistência
* ✅ Gerenciamento de tema global com Provider e Isar
* 🚀 Suporte completo a Dark Mode em todos os temas (futuro)
* 🚀 Refinamento de UI e experiência do usuário
* 🚀 Gerenciamento de estado avançado (Riverpod ou outro - futuro)
* 🚀 Deploy na Play Store e Desktop (futuro)

---

## 🤝 Contribuição

Contribuições são bem-vindas!
Sinta-se à vontade para abrir **issues**, enviar **pull requests** ou sugerir melhorias.

---

## 🧠 Sobre este Projeto

Este projeto faz parte de um processo de **aprendizado, desenvolvimento e prototipagem** para apps Flutter com banco de dados local.
Ele também visa criar uma base para outros aplicativos educativos e comerciais no futuro, com foco em qualidade de código, arquitetura escalável e design elegante.

---

## 🧑‍💻 Autor

Desenvolvido por **Paulo Castelo – Mr. Anderson (ZeroAvenger)**

• 🚀 [LinkedIn](https://www.linkedin.com/in/paulo-castelo/)
• 💻 [GitHub](https://github.com/paulocastelo)
• 🌐 [Portfólio (Em construção)](https://github.com/paulocastelo)

---

## 📝 Licença

Este projeto está sob a licença MIT.
Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
