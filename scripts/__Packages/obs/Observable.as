class obs.Observable
{
   function Observable()
   {
      this.observers = new Array();
   }
   function addObserver(o)
   {
      if(o == null)
      {
         return false;
      }
      var _loc3_ = this.observers.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.observers[_loc2_] == o)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.observers.push(o);
      return true;
   }
   function removeObserver(o)
   {
      var _loc3_ = this.observers.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.observers[_loc2_] == o)
         {
            this.observers.splice(_loc2_,1);
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function notifyObservers(infoObj)
   {
      var _loc3_ = this.observers.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.observers[_loc2_].update(this,infoObj);
         _loc2_ = _loc2_ + 1;
      }
   }
   function clearObservers()
   {
      this.observers = new Array();
   }
   function countObservers()
   {
      return this.observers.length;
   }
}
