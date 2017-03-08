  $(function(){
      search();
  });

  function search() {
      var staffID = $('#staffID').val();
      var staffName = $('#staffName').val();
      var staffGroup = $('#staffGroup').val();
      $.ajax({
          type: "POST",
          url: "/efly/manager/search",
          data: 'user_id=' + staffID + '&user_name=' + staffName + '&group_name=' + staffGroup,
          success: function(userList){
            $('#table').html('');
            $('#table').html('<table id="context" class="row-border hover order-column" width="100%" BORDER="1"></table>');
            var users = new Array();
            for (user in userList) {
                users[user] = [
                    userList[user].user_id, 
                    userList[user].user_name, 
                    userList[user].email, 
                    userList[user].phone_number, 
                    userList[user].group_name, 
                    '<a href="javascript:deleteUser(' + userList[user].user_id + ') " style="color:#44889d">删除</a>', 
                ]; 
            }
            $('#context').DataTable({
                  data: users,
                  columns: [
                      { title: "卡号" },
                      { title: "姓名" },
                      { title: "邮箱" },
                      { title: "电话" },
                      { title: "组别" },
                      { title: "操作" }
                  ]
            });
          }
      });
  }

  function deleteUser(userId) {
      if(confirm("是否要删除用户 : " + userId)) {
          window.location.href="/efly/manager/delete?user_id=" + userId;
      }
  }