# 📚 Biblioteca Virtual em Dart

## 📖 Descrição
Este projeto implementa uma **biblioteca virtual em Dart**.  

Ele permite:  
- Cadastrar novos livros com atributos como **título, autor, ano de publicação e gênero**.  
- Remover livros da biblioteca por **ID** ou por **título**.  
- Listar todos os livros cadastrados de forma organizada.  

O projeto inclui uma classe `Biblioteca` que gerencia os livros e um programa principal (`main`) para demonstrar o funcionamento da biblioteca.  

---

## 🗂 Estrutura do projeto


📁 biblioteca_virtual
└── main.dart # contém as classes Livro e Biblioteca + código principal

---

## ▶️ Como executar

1. Instale o Dart no seu computador: [Instruções de instalação](https://dart.dev/get-dart)  
2. Abra o terminal na pasta do projeto.  
3. Execute o programa com o comando:  

```bash
dart run main.dart

⚙️ Funcionalidades demonstradas no main()

📌 Cadastra três livros de exemplo.

📋 Lista todos os livros cadastrados.

❌ Remove um livro pelo título.

❌ Remove outro livro pelo ID.

📋 Lista novamente os livros restantes após as remoções.

🖥 Exemplo de saída no terminal

--- Livros cadastrados ---
[1] "Dom Casmurro" - Machado de Assis (1899) | Gênero: Romance
[2] "O Senhor dos Anéis" - J.R.R. Tolkien (1954) | Gênero: Fantasia
[3] "1984" - George Orwell (1949) | Gênero: Distopia

Removendo "1984"...
🗑️ Livro(s) removido(s).

Removendo livro com ID 2...
🗑️ Livro removido.

--- Livros finais ---
[1] "Dom Casmurro" - Machado de Assis (1899) | Gênero: Romance


💡 Observações

Cada livro possui um ID único, que facilita a remoção.

A listagem exibe todos os livros cadastrados de forma organizada.

O código está pronto para ser documentado e expandido, caso deseje adicionar:

📂 Persistência em arquivo

🖥 Interface interativa
