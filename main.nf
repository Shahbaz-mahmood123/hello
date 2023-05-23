#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  publishDir '/home/shahbaz'
  publishDir '/home/shahzeb'
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x test!' > hello_world.txt
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
    """
    
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'Test if tower picked up new commit', 'resume pipeline') | sayHello | view
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

