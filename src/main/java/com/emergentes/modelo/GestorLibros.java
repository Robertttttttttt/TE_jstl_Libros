
package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class GestorLibros {
    private ArrayList<Libro> lista;
    
    public GestorLibros(){
        lista=new ArrayList<Libro>();
    }
    public ArrayList<Libro> getLista() {
        return lista;
    }
    public void setLista(ArrayList<Libro> lista) {
        this.lista = lista;
    }
    public void insertarTarea(Libro item){
        lista.add(item);
    }
    public void modificarTarea(int pos,Libro item){
        lista.set(pos,item);
    }
    public void eliminarTarea(int pos){
        lista.remove(pos);
    }    
    public int obtieneId(){
        int idaux=0;
        
        for (Libro item : lista){
            idaux =item.getId();
        }
        return idaux +1;
    }
    public int ubicarTarea(int id){
        int pos=-1;
        Iterator<Libro> it = lista.iterator();
        
        while (it.hasNext()){
            ++pos;
            Libro aux =it.next();
            
            if (aux.getId()==id){
                break;
            }
        }
        return pos;
    }   
}
