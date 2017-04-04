<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProfileSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'CompleteName') ?>

    <?= $form->field($model, 'slug') ?>

    <?= $form->field($model, 'Email') ?>

    <?php // echo $form->field($model, 'Nickname') ?>

    <?php // echo $form->field($model, 'HomeAddress') ?>

    <?php // echo $form->field($model, 'gender') ?>

    <?php // echo $form->field($model, 'CellphoneNumber') ?>

    <?php // echo $form->field($model, 'commments') ?>

    <?php // echo $form->field($model, 'text') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
