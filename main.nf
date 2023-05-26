#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  output:
  file "hello.txt"

  publishDir 'results'
  publishDir 'results_number_2'

  script:
  """
  echo 'Hello, World!' > hello.txt
  echo 'pre-run script value: $NXF_PRERUN_BASE64'
  """
}

process testingOtherQueue {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    env.x = "echo '$NXF_PRERUN_BASE64' | base64 --decode".execute().text.trim()
    echo 'pre-run script value: ${env.x}'
    """
    
}

workflow {
  sayHello()
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

