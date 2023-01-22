# PracticaDesignPatterns
Practica DesignPatterns

# Notas:

He realizado ambas versiones, tanto MVVM como VIPER. Para acceder a la versión VIPER eliminar el comentario del SceneDelegate (de la linea 22 a la 32).

# Dudas que me han quedado:
VIPER:
- Fichero View. Lineas 90 y 91:
  En un principio he intentado activar el iterator como en la linea comentada. "LoginIterator().tryLogin(with: loginData)". 
  Esto no daba error pero no funcionaba, la ejecucion del  debugger terminaba en el fichero Nerworking en task.resume().
  Luego lo he intentado con usando el presenter como "presenter?.interactor?.tryLogin(with loginData)". 
  ¿La primero forma no funciona porque al llamar al metodo sin usar el presenter, no tiene el valor de las relaciones que se hacen en el Router?
  
 - Fichero Interactor. Linea 32:
 En el ejemplo de clase se usaba "self?.presenter?.metodo". En mi caso el fichero es muy similar, pero no me deja con "self?", con self a secas funciona bien, el error
 que da es que no se puede usar el encadenamiento de opcionales en algo no opcional. No entiendo por que en clase si que sirvió y en este caso no. 

MVVM:

- ¿Por que en el metodo loadView() del controlador no hace falta llamar al constructor de la clase que se sobreescribe con super.loadView?

- ¿Usar un DispatchQueue dentro de un DispatchQueue puede dar problemas? 
Mientras hacia el ejercicio lo hice porque no sabia bien donde ponerlo (si a a la hora de llamar al metodo de navegacion o dentro de este).
En un momento lo tuve en los dos stios y funcionaba bien. Entiendo que es mala practica ya que cuando lo puse solo en la llamada se solucionó mi problema, pero me he quedado con la duda. 

Gracias y un saludo. 
