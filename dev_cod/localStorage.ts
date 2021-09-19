  // Adds data to credentials local storage.
  insert_credentials_from_ls(creds: any[]): void{
    localStorage.setItem(LocalStorageKeys.Credentials, JSON.stringify(creds));
  }

  // Retrieves data from local storage.
  get_ls_items(ls_key: string): any{
    return JSON.parse(localStorage.getItem(ls_key));
  }

  // Updates or adds data to credentials local storage.
  insert_or_update_handler_credentials_from_ls(inst: any): void{
    const cred_obj = this.get_ls_items(LocalStorageKeys.Credentials) || [];

    const obj = cred_obj.filter((item) => 
      item.host === inst.host && item.site_id === inst.site_id &&
      item.subsite === inst.subsite && item.user === inst.user).pop();
    const index = cred_obj.indexOf(obj);

    if (index > -1) {
      cred_obj.splice(index, 1);
    }
    cred_obj.push(inst);
    this.insert_credentials_from_ls(cred_obj);
  }
    
  // The main function for adding or updating data in credentials local storage.
  save_credentials_to_ls(): void{
    let inst_1 = this.get_ls_items(LocalStorageKeys.Instances)[0];
    let inst_2 = this.get_ls_items(LocalStorageKeys.Instances)[1];

    this.insert_or_update_handler_credentials_from_ls(inst_1);
    this.insert_or_update_handler_credentials_from_ls(inst_2);
  }
