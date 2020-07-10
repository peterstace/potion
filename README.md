# Potion

Vim plugin for the Potion language.

## How to use the potion interpreter

A Dockerfile is included in the `examples` dir, which allows you to run potion scripts.

```
docker build . -f examples/Dockerfile -t potion
docker run -it -v $PWD/examples:/scripts potion /scripts/factorial.pn
```
