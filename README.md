# Trivial example of lenses generation and usage in purescript

# Generation

To generate lenses you have to install 'purescript-derive-lenses'. Next you have to invoke lenses generation for given module. It's better to keep them in separate module as you are going to update this file when your data types would change.


Our data types are defined in `src/Person.purs` module, so to generate lenses for them we have to run:

     cat ./src/Person.purs | purescript-dervie-lenses --moduleName Person.Lenses > ./src/Person/Lenses.purs

I've performed above command already, so you are going to find pregenerated lenses module in this repo.

Now we can use lenses...


# Usage

Just look into `Main.purs` you can find (run and modify) these examples:

    ```purescript
    paluh = Person {fullName: "paluh", age: 35, gender: Male}

    view (L._Person <<< L.fullName) paluh

    set (L._Person <<< L.fullName) "Sir Paluh" paluh

    over (L._Person <<< L.age) (_ + 3) paluh
    ```

