class events.AngryMobEvent extends events.Event
{
   function AngryMobEvent()
   {
      super();
      this.image = "angrymobpic";
      this.title = _root.angryMobEventTitle;
      this.description = _root.angryMobEvDe;
      this.secDescription = _root.angryMobEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("mob");
   }
}
