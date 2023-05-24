#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  output:
  file "hello.txt"

  script:
  """
  echo 'Hello, World!' > hello.txt
  """

  publishDir 'results'
  publishDir 'results_number_2'
}

process testingOtherQueue {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
    
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'Test if tower picked up new commit', 'resume pipeline') | sayHello | view
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

