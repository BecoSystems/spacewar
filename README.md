# spacewar

Repositório para testes de fork e aprendizado do git

## Como fazer esse exercício

Este exercício envolve as duas disciplinas Programação 1 (o aluno faz o papel do desenvolvedor) e Programação 2 (o aluno faz o papel do gerente de projeto).

 * Os alunos de Programação 1 devem entrar em contato com um aluno de Programação 2 para ter um gerente.
 * Os alunos de Programação 2 devem pegar um ou mais alunos de Programação 2 para gerenciar.

Não deixem alunos sem par.

### Repositórios

Existem 3 repositórios.

 1. O repositório upstream é o repositório final (a empresa é a dona). Você não tem acesso a gravação neste repositório. Pode apenas fazer a leitura. Isto é: você não consegue fazer `git push` neste repositório.
 2. O repositório origin é criado na sua conta através do botão de `fork`. Ele duplica o upstream, e neste repositório você tem permissão de gravação. Isto é: você pode fazer `git push` aqui.
 3. O repositório local é criado com um `git clone` do seu repositório origin. Não faça clone do upstream, pois não conseguirá fazer push.

Quando você faz um clone local de um remoto, o git automaticamente liga o local com o remoto origin. Mas o git não sabe nada sobre um terceiro repositório, o upstream. 
Você deve adicionar esse outro remoto com o comando `git add remote ...`, conforme explicação mais abaixo (e leitura do hydrabox).

### Alunos de Programação 1:

A sequência de trabalho é:

 * O professor já criou um repositório upstream chamado spacewar na organização BecoSystems. Esse repositório você não consegue escrever.
 * O professor adiciona os colaboradores (Programação 1) com permissão de apenas leitura (para conseguir fazer fork).
 * Cada aluno de Programação 1 faz seu fork e depois o clone do seu repositório origin, e trabalha de forma individual.
 * Após o já conhecido commit (no local) e push (no origin), é preciso ir até o website github/gitlab e clicar em criar Pull Request.
 * O código vai sendo colaborativamente adicionado no upstream pelos alunos de Programação 2 ao aceitarem PR (Pull Request), conforme cada aluno de Programação 1 faz PR.
 * Todos alunos de programação 1 devem fazer o clone do repositório origin no Hydra, na sua pasta rascunhos.
 * Ao final, após ter seu PR aceito, faça também um clone (ou copie a pasta clonada em rascunhos) na pasta trabalhos no Hydra.

#### Comandos e ações na ordem:

 1. Fork. 

```
Sem comando. Feito no próprio website do github/gitlab, botão `fork`.
```

 2. Clone em rascunhos.

```
$ cd rascunhos
$ git clone git@github.com:seuusuario/spacewar.git
$ cd spacewar
```

Atenção: neste ponto, você deve configurar o upstream (apenas uma vez). Veja como no hydrabox, arquivo 11-msg-git.txt, item 11, 11a.

 3. Editar spacewar-rules.md e adicionar uma regra

```
$ vim spacewar-rules.md
```

 4. Commit (registra local)

```
$ git cm "regra XXX: assunto tal e tal"
```

 5. Push (registra remoto no origin, que é o seu fork)

```
$ git push
```

 6. PR (pull request, pede para unir o origin com o upstream). Feito no website, botão `New pull request`, e então `Create pull request`.
 7. Aguardar resultado, acompanhar pelo website (alunos de Prog. 2 aceitar ou rejeitar, e dar um motivo).
 8. Após resultado, repetir em caso de rejeição

Atenção: se for rejeitado, muito provavelmente seu remoto origin/master deve estar desatualizado em relação ao remoto upstream/master.
Isso acontece pois você só consegue adicionar uma regra no repositório local e no repositório remoto em seu nome (origin), mas não consegue adicionar a regra no repositório upstream diretamente.
E se alguém teve a regra aceita, você deve "baixar" as alterações do remoto upstream para seu remoto origin e também seu repositório local.

Para resetar seus ramos remoto origin e local, você deve seguir as explicações dadas no hydrabox, arquivo 11-msg-git.txt, item 11, 11b.


 9. Em caso do resultado ser Aceito o PR: clonar o seu fork na pasta trabalhos e fim.



### Alunos de Programação 2:

Cada aluno de Programação 2 deve "adotar" um ou alguns alunos de Programação 1. 

Seu trabalho será apenas de aceitar o PR feito pelo aluno, se o mesmo estiver no padrão. Este exercício tem a função de ensinar o aluno de Programação 2 o que é estar "do outro lado" do PR, ou seja, fazer o papel de gerente de projeto, enquanto o aluno de Programação 1 é o desenvolvedor/programador.

 * Após o já conhecido commit (no local) e push (no origin), é preciso ir até o website github/gitlab e clicar em criar Pull Request.
 * O código vai sendo colaborativamente adicionado no upstream pelos alunos de Programação 2 ao aceitarem PR (Pull Request), conforme cada aluno de Programação 1 faz PR.
 * Todos alunos de programação 1 devem fazer o clone do repositório origin no Hydra, na sua pasta rascunhos.
 * Ao final, após ter seu PR aceito, faça também um clone (ou copie a pasta clonada em rascunhos) na pasta trabalhos no Hydra.

 * O professor já criou um repositório upstream chamado spacewar na organização BecoSystems.
 * O professor adiciona os colaboradores (Programação 2) com permissão de escrita (para conseguir aceitar PRs).
 * O aluno de Programação 2 não precisa fazer fork, e nem clone. Trabalhará apenas no website github/gitlab.
 * Cada aluno de Programação 2 deve conferir e aceitar ou rejeitar os PRs feitos pelos alunos de Programação 1.
 * O código vai sendo colaborativamente adicionado no upstream pelos alunos de Programação 2 ao aceitarem PR (Pull Request), conforme cada aluno de Programação 1 faz PR.
 * Todos alunos de Programação 2 devem rejeitar/aceitar os PRs dos seus alunos de Programação 1, até que finalmente seja aceito com sucesso.
 * Ao final, após ter aceito os PRs dos alunos de Programação 2, siga as instruções abaixo para indicar ao controllami que acabou.

Você terá acesso de gravação no upstream. Seu objetivo é aceitar os PRs que chegam. Para isso, siga na ordem, comentando no website:

 * Entre no repositório https://github.com/BecoSystems/spacewar
 * Vá em Pull Requests
 * Comece pelo PR mais antigo, que adiciona uma certa regra número X.
 * Se este PR for aceito, todos os PRs dos outros alunos após ele devem ser rejeitados com a justificativa:

 ```
 PR rejeitado. Motivo: esta regra já existe.
 ```

  * Para aceitar, considere as seguintes propriedades que um bom PR deve ter:
    * `PR rejeitado. Motivo: esta regra já existe.`
    * `PR rejeitado. Motivo: regra do semestre anterior`
    * `PR rejeitado. Motivo: alterar o template e colocar uma descrição válida no PR` 
    * `PR rejeitado. Motivo: você alterou mais de uma linha`
    * `PR rejeitado. Motivo: PR sem descrição`
    * `PR rejeitado. Motivo: Não usar acentos em mensagens de commit`
    * `PR rejeitado. Motivo: Commit fora do padrão. Usar mensagens claras no commit`

Se o PR estiver dentro da conformidade, aceitar e colocar a mensagem no website:

    * `PR aceito. Fazer o clone na pasta trabalhos`
 

#### Comandos e ações na ordem:

O trabalho é realizado diretamente no website do github/gitlab, e não envolve comandos no Hydra.

Após o(s) seu(s) aluno(s) adotado(s) conseguir ter o PR aceito, você deve marcar que terminou esta atividade no controllami com o comando:

```
$ cd programa2/trabalhos
$ vim spacewar
```

Adicione no arquivo `spacewar` o nome dos alunos de Programação 1 que você gerenciou, um por linha.

### Realização

* Prof. Dr. Ruben Carlo Benante
* Contato: rcb@upe.br
* Data: 2022-03-14

