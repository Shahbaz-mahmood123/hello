#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  label 'otherQueue'
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
    
}

process testingOtherQueue {
  label: 'secondQueue'
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
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | sayHello | view
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

