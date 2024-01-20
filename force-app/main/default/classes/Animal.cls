public virtual class Animal {
    
    public virtual void eat (){ // virtual demek seni override yaptım demektir
        system.debug('Animals eat');
    }
    
    public void drink(){
        system.debug('Animals drink');
    }
  
}