import 'dart:io';

class Livro {
  int id;
  String titulo;
  String autor;
  int anoPublicacao;
  String genero;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
    required this.genero,
  });

  @override
  String toString() {
    return '[$id] "$titulo" - $autor (${anoPublicacao}) | Gênero: $genero';
  }
}

class Biblioteca {
  final List<Livro> _livros = [];
  int _proximoId = 1;

  Livro cadastrarLivro({
    required String titulo,
    required String autor,
    required int anoPublicacao,
    required String genero,
  }) {
    final livro = Livro(
      id: _proximoId++,
      titulo: titulo,
      autor: autor,
      anoPublicacao: anoPublicacao,
      genero: genero,
    );
    _livros.add(livro);
    return livro;
  }

  bool removerLivroPorId(int id) {
    final livro = _livros.firstWhere(
      (l) => l.id == id,
      orElse: () => null as Livro,
    );
    if (livro != null) {
      _livros.remove(livro);
      return true;
    }
    return false;
  }

  bool removerLivroPorTitulo(String titulo) {
    final livrosParaRemover = _livros
        .where((l) => l.titulo.toLowerCase() == titulo.toLowerCase())
        .toList();
    if (livrosParaRemover.isEmpty) return false;
    _livros.removeWhere((l) => livrosParaRemover.contains(l));
    return true;
  }

  void listarLivros() {
    if (_livros.isEmpty) {
      print('📚 A biblioteca está vazia.');
    } else {
      print('\n--- Livros na Biblioteca (${_livros.length}) ---');
      for (final livro in _livros) {
        print(livro);
      }
    }
  }
}

void main() {
  final biblioteca = Biblioteca();

  while (true) {
    print('\n=== Biblioteca Virtual ===');
    print('1) Adicionar livro');
    print('2) Remover livro por ID');
    print('3) Remover livro por título');
    print('4) Listar livros');
    print('0) Sair');
    stdout.write('Escolha uma opção: ');

    final opcao = stdin.readLineSync()?.trim() ?? '';

    switch (opcao) {
      case '1':
        final titulo = _lerEntrada('Título: ');
        final autor = _lerEntrada('Autor: ');
        final ano = _lerInt('Ano de publicação: ');
        final genero = _lerEntrada('Gênero: ');

        final novo = biblioteca.cadastrarLivro(
          titulo: titulo,
          autor: autor,
          anoPublicacao: ano,
          genero: genero,
        );
        print('✅ Livro cadastrado: $novo');
        break;

      case '2':
        final id = _lerInt('Informe o ID do livro a remover: ');
        final removido = biblioteca.removerLivroPorId(id);
        print(removido ? '🗑️ Livro removido.' : '❌ Nenhum livro encontrado com esse ID.');
        break;

      case '3':
        final titulo = _lerEntrada('Informe o título do livro a remover: ');
        final removido = biblioteca.removerLivroPorTitulo(titulo);
        print(removido ? '🗑️ Livro(s) removido(s).' : '❌ Nenhum livro encontrado com esse título.');
        break;

      case '4':
        biblioteca.listarLivros();
        break;

      case '0':
        print('👋 Encerrando o sistema.');
        return;

      default:
        print('⚠️ Opção inválida. Tente novamente.');
    }
  }
}

String _lerEntrada(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()?.trim() ?? '';
}

int _lerInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final entrada = stdin.readLineSync();
    final valor = int.tryParse(entrada ?? '');
    if (valor != null) return valor;
    print('⚠️ Digite um número inteiro válido.');
  }
}
