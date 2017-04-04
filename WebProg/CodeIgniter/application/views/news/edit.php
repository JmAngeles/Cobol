<h2><?php echo $title; ?></h2>
 
<?php echo validation_errors(); ?>
 
<?php echo form_open('news/edit/'.$news_item['id']); ?>
    <table>
		<tr>
            <td><label for="CompleteName">Complete Name</label></td>
            <td><input type="text" name="CompleteName" size="32" value="<?php echo $news_item['CompleteName'] ?>" /></td>
        </tr>
		 <tr>
            <td><label for="Nickname">Nickname</label></td>
            <td><input type="text" name="Nickname" size="8" value="<?php echo $news_item['Nickname'] ?>" /></td>
        </tr>
		 <tr>
            <td><label for="Email">Email Address</label></td>
            <td><input type="email" name="Email" size="32" value="<?php echo $news_item['Email'] ?>" /></td>
        </tr>
		 <tr>
            <td><label for="HomeAddress">Home Address</label></td>
            <td><input type="text" name="HomeAddress" size="36" value="<?php echo $news_item['HomeAddress'] ?>" /></td>
        </tr>
		<tr>
            <td><label for="gender">Gender</label></td>
            <td><input type="radio" name="gender" value="Female" required
				<?php if (isset($news_item['gender']) && $news_item['gender']=="Female") echo 'checked';?>>Female
				<input type="radio" name="gender" value="Male" required 
				<?php if (isset($news_item['gender']) && $news_item['gender']=="Male") echo 'checked';?>>Male
			</td>
        </tr>
		 <tr>
            <td><label for="CellphoneNumber">Cellphone Number</label></td>
            <td><input type="tel" name="CellphoneNumber" size="11" value="<?php echo $news_item['CellphoneNumber'] ?>" /></td>
        </tr>
		 <tr>
            <td><label for="comments">Comments</label></td>
            <td><textarea name="comments" rows="10" cols="40" size="300"><?php echo $news_item['comments'] ?></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Edit news item" /></td>
        </tr>
    </table>
</form>