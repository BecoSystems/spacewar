Ao incluir um **bug report** tenha o cuidado de cumprir este _check-list_:

* Coloque (pelo menos) um _label_.
* Associe um _milestone_.
* Se houver divisão de tarefas, associe a pessoa responsável pelo _bug_.
* Confira se o _bug_ já não foi relatado, evite _bugs_ duplicados.
* Se houver _bugs_ parecidos ou relacionados, inclua um link para eles.
* Confira se está usando a última versão do programa no _develop_.
* Descreva apenas um único _bug_ por _issue_.
* Relate fatos úteis: mensagens de erros, comportamento errático, arquivos ou recursos problemáticos.
* Não relate opiniões, críticas, reclamações ou questões pessoais.
* Se é um _bug_ de segurança, faça o relato em privado. Não coloque a galinha na boca da raposa.
* Seja preciso: vá direto ao ponto, sem rodeios.
* Seja claro: evite pronomes indefinidos (isso, aquilo). Escreva explicitamente o que é, onde é (linha), nome da variável ou função, etc.
* Todo _bug_ merece relatório: não existe _bug_ simples demais para valer um relatório.
* Configure a saída de erro para inglês. Se preciso relatar uma mensagem de erro maior, use o comando _sprunge_.

Ao criar o **bug report**, siga este guia:

0- Assunto (título)
* Objetivo: tornar o bug "buscável" (_searchable_) e inequivocadamente identificável.
* Tamanho: máximo de 100 caracteres. Recomendado até 60.
* Ruim: Travou o arrastar
* Bom: Arrastar textos de uma página trava o editor

1- Descrição
* Objetivo: explicar o bug para o programador.
* Inclui:
    - Resumo do comportamento (interpretação das falhas)
    - Justificativa do motivo que é um bug
    - Quaisquer especificações relevantes
    - Interpretação da especificação
    - Informação em outros programas ou implementações similares

2- Passos para a reprodução
* Objetivo: Ensinar ao desenvolvedor (programador) como recriar o bug no sistema dele
* Caso simples:
    - Dê explicações junto com cada comando real ou operação realizada.
* Caso complexo:
    - Explique cada comando digitado, na ordem.
    - Cada clique ativando determinada função do programa
    - Caso tenha alterado as configurações padrão do sistema, indique o que há de diferente.
    - Faça upload de um caso de teste

3- Resultados obtidos
* A mensagem de erro
* A descrição de um comportamento errático
    - Descreva o que obteve de resposta
    - Cite (literalmente) a(s) mensagem(ns) de erro retornada(s) (use o _sprunge_)

4- Resultados esperados
* Como seria o correto em caso de sucesso
* Objetivo: mostrar ao desenvolvedor o que está errado
    - Descreva o que você entende que deveria ser a resposta correta
    - Escreva de modo preciso como seria a mensagem de saída em caso de sucesso

5- Caso de teste mínimo
* Objetivo: isolar o problema e permitir a sua imediata reprodução
    - Remova toda informação desnecessária ao teste para a reprodução do _bug_
    - Variações: tente variações do "_test case_" mínimo para descobrir outras situações que também podem disparar o _bug_
    - Anexe arquivos que julgar necessários (fotos, arquivos de entrada, arquivos de saída)
    - Não use "fotos" de texto, pois não permitem facilmente reproduzir o erro e reutilizar (copiar) a informação digitada

6- Versões e plataforma
* Tenha a certeza de estar tratando da última versão. Senão este _bug_ pode já estar resolvido na versão mais recente. Inclua:
    - Versão do programa
    - Sistema Operacional
    - Arquitetura do computador ou dispositivo (hardware, celular, tablet, &c)
    - Acesso (remoto ou local)

7- Informações adicionais
* Seu login ou username
* Nomes completos dos arquivos relevantes
* Pasta/diretório onde estão localizado os arquivos relevantes
* URLs, referências, links para mensagens do _sprunge_ ou outros artigos
* Dados do crash (core dumped, texto, input, &c)
* Arquivos de log (/var/log/ ou outros) (quando longos, devem ser preferencialmente anexados)
* Use _labels_ para descrever a gravidade do _bug_. A classificação mais usada é:
    - Urgente: afeta a todos (usuários e público em geral).
    - Grave: afeta todos usuários
    - Média: afeta um determinado grupo de pessoas (ou meu próprio grupo)
    - Leve: afeta apenas a mim ou a uma outra pessoa
    - Pedido: não afeta ninguém, este é apenas o pedido para se criar uma nova característica do software.

