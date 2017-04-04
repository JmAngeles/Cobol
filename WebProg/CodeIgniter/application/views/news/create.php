<h2><?php echo $title; ?></h2>
 
<?php echo validation_errors(); ?>
 
<?php echo form_open('news/create'); ?>    
    <table>
		 <tr>
            <td><label for="CompleteName">Complete Name</label></td>
            <td><input type="text" name="CompleteName" size="32" /></td>
        </tr>
		 <tr>
            <td><label for="Nickname">Nickname</label></td>
            <td><input type="text" name="Nickname" size="8" /></td>
        </tr>
		 <tr>
            <td><label for="Email">Email Address</label></td>
            <td><input type="email" name="Email" size="32" /></td>
        </tr>
		 <tr>
            <td><label for="HomeAddress">Home Address</label></td>
            <td><input type="text" name="HomeAddress" size="36" /></td>
        </tr>
		<tr>
            <td><label for="gender">Gender</label></td>
            <td><input type="radio" name="gender" value="Female" required>Female
				<input type="radio" name="gender" value="Male" required>Male 
			</td>
        </tr>
		 <tr>
            <td><label for="CellphoneNumber">Cellphone Number</label></td>
            <td><input type="number" name="CellphoneNumber" size="11"/></td>
        </tr>
		 <tr>
            <td><label for="comments">Comments</label></td>
            <td><textarea name="comments" rows="10" cols="40" size="300"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Create news item" /></td>
        </tr>
    </table>    
</form>