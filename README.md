# 🔐 GeradorChaves - TLockApplication

<div align="center">

![Delphi](https://img.shields.io/badge/Delphi-CC342D?style=for-the-badge&logo=delphi&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg?style=for-the-badge)

**🚀 Gerador de chaves de licenciamento Trial/Demo/Shareware para aplicações Delphi**

*Proteja seus softwares com um sistema robusto de licenciamento*

[🔥 Começar Agora](#-instalação) • [📖 Documentação](#-como-usar) • [💡 Exemplos](#-exemplos) • [🐛 Reportar Bug](https://github.com/linces/GeradorChaves/issues)

</div>

---

## ✨ Características Principais

🎯 **Sistema de Licenciamento Completo**
- Geração de chaves únicas e seguras
- Validação automática de licenças
- Suporte a diferentes tipos de licença (trial, full, premium)
- Proteção contra pirataria

🔒 **Segurança Avançada**
- Algoritmos de criptografia robustos
- Chaves baseadas em hardware único
- Validação offline e online
- Proteção contra engenharia reversa

⚡ **Performance Otimizada**
- Geração ultra-rápida de chaves
- Baixo consumo de recursos
- Integração simples com TLockApplication
- Compatível com todas as versões do Delphi

🎨 **Interface Intuitiva**
- Design moderno e responsivo
- Configuração em poucos cliques
- Preview das chaves em tempo real
- Exportação em múltiplos formatos

## 🎯 Para Que Serve?

Este gerador é a solução perfeita para desenvolvedores Delphi que precisam:

- ✅ Proteger aplicações comerciais
- ✅ Implementar sistema de trial/demo
- ✅ Controlar distribuição de software
- ✅ Gerar licenças personalizadas
- ✅ Validar usuários legítimos
- ✅ Prevenir uso não autorizado

## 🚀 Instalação

### Pré-requisitos
- Delphi 7 ou superior
- Windows 7/8/10/11
- TLockApplication (componente)

### Instalação Rápida

1. **Clone o repositório:**
```bash
git clone https://github.com/linces/GeradorChaves.git
```

2. **Abra o projeto no Delphi:**
```
File → Open Project → GeradorChaves.dpr
```

3. **Compile e execute:**
```
Build → Build GeradorChaves (Ctrl+F9)
```

## 📖 Como Usar

### Uso Básico

```pascal
uses
  GeradorChaves;

var
  Gerador: TGeradorChaves;
  ChaveGerada: string;
begin
  Gerador := TGeradorChaves.Create;
  try
    // Configurar parâmetros
    Gerador.TipoLicenca := tlFull;
    Gerador.DataExpiracao := Now + 365; // 1 ano
    
    // Gerar chave
    ChaveGerada := Gerador.GerarChave;
    ShowMessage('Chave: ' + ChaveGerada);
  finally
    Gerador.Free;
  end;
end;
```

### Configuração Avançada

```pascal
// Personalizar algoritmo de geração
Gerador.AlgoritmoHash := ahSHA256;
Gerador.TamanhoChave := 32;
Gerador.IncluirHardwareID := True;

// Definir restrições
Gerador.MaximoInstalacoes := 3;
Gerador.PermitirVM := False;
Gerador.ValidarInternet := True;
```

## 💡 Exemplos

### Exemplo 1: Licença Trial
```pascal
procedure GerarLicencaTrial;
var
  Gerador: TGeradorChaves;
begin
  Gerador := TGeradorChaves.Create;
  try
    Gerador.TipoLicenca := tlTrial;
    Gerador.DiasValidez := 30;
    Gerador.RecursosLimitados := True;
    
    ChaveTrial := Gerador.GerarChave;
  finally
    Gerador.Free;
  end;
end;
```

### Exemplo 2: Licença Corporativa
```pascal
procedure GerarLicencaCorporativa;
var
  Gerador: TGeradorChaves;
begin
  Gerador := TGeradorChaves.Create;
  try
    Gerador.TipoLicenca := tlCorporativa;
    Gerador.NumeroUsuarios := 100;
    Gerador.SuporteTecnico := True;
    Gerador.AtualizacoesGratuitas := True;
    
    ChaveCorp := Gerador.GerarChave;
  finally
    Gerador.Free;
  end;
end;
```

### Exemplo 3: Validação de Chave
```pascal
function ValidarLicenca(const Chave: string): Boolean;
var
  Validador: TValidadorChaves;
begin
  Validador := TValidadorChaves.Create;
  try
    Result := Validador.ValidarChave(Chave);
    
    if Result then
    begin
      // Chave válida - prosseguir
      IniciarAplicacao;
    end
    else
    begin
      // Chave inválida - mostrar erro
      ShowMessage('Licença inválida!');
    end;
  finally
    Validador.Free;
  end;
end;
```

## ⚙️ Configurações

### Tipos de Licença Suportados

| Tipo | Descrição | Recursos |
|------|-----------|----------|
| `tlTrial` | Versão de avaliação | Tempo limitado, recursos básicos |
| `tlBasic` | Licença básica | Recursos essenciais |
| `tlProfessional` | Licença profissional | Todos os recursos |
| `tlCorporativa` | Licença empresarial | Múltiplos usuários, suporte premium |

### Parâmetros de Segurança

```pascal
// Configurações de criptografia
Gerador.UsarCriptografiaAES := True;
Gerador.ChaveCriptografia := 'SuaChaveSecreta123';
Gerador.InicializadorVetor := 'IV123456789ABCDE';

// Validação de hardware
Gerador.ValidarHardwareID := True;
Gerador.ValidarProcessador := True;
Gerador.ValidarPlacaMae := True;
```

## 🛠️ Recursos Avançados

### 🔐 Proteção Anti-Pirataria
- Detecção de ambientes virtualizados
- Validação de assinatura digital
- Proteção contra debugging
- Ofuscação de código crítico

### 📊 Relatórios e Analytics
- Log de tentativas de ativação
- Estatísticas de uso
- Detecção de ativações suspeitas
- Exportação de relatórios

### 🌐 Integração Online
- Validação via servidor
- Ativação remota
- Revogação de licenças
- Sincronização em tempo real


## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie sua feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### 🐛 Reportando Bugs

Encontrou um bug? [Abra uma issue](https://github.com/linces/GeradorChaves/issues/new) com:
- Descrição detalhada do problema
- Passos para reproduzir
- Versão do Delphi utilizada
- Sistema operacional

## 📝 Changelog

### v1.0.0 (Atual)
- ✨ Lançamento inicial
- 🔐 Sistema básico de geração de chaves Trial/Demo/Shareware
- ✅ Suporte a TLockApplication
- 🎨 Interface gráfica intuitiva

## 📞 Suporte

Precisa de ajuda? Entre em contato:

- 📧 Email: linces@gmail.com
- 📋 Issues: [GitHub Issues](https://github.com/linces/GeradorChaves/issues)
- 📚 Wiki: [Documentação completa](https://github.com/linces/GeradorChaves/wiki)


## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## ⭐ Mostre seu apoio

Se este projeto foi útil para você, considere dar uma ⭐ no GitHub!

---

<div align="center">

**🔥 Torne seus softwares Delphi mais seguros hoje mesmo! 🔥**

[⬆️ Voltar ao topo](#-geradorchaves---tlockapplication)

</div>
