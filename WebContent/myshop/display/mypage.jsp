<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.member.MemberDTO"%>
<%@ page import="my.member.MemberDAO"%>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%
    MemberDAO dao =  MemberDAO.getInstance(); 
    int no = Integer.parseInt(request.getParameter("no"));
    System.out.println(no);
    MemberDTO member = dao.getMemberSelect(no);
    
    %>

<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">My page</h4>
				</div>
				<div style="height: 550px;">

					<div style="padding: 0 0 25px 0;"></div>

					<table width="100%" border="0" cellpadding="0" cellspacing="1"
						bgcolor="#858eab" style="line-height: 250%;">
						
						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
