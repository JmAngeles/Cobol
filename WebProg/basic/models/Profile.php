<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Profile".
 *
 * @property integer $id
 * @property string $title
 * @property string $CompleteName
 * @property string $slug
 * @property string $Email
 * @property string $Nickname
 * @property string $HomeAddress
 * @property string $gender
 * @property integer $CellphoneNumber
 * @property string $commments
 * @property string $text
 */
class Profile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Profile';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'title', 'CompleteName', 'slug', 'Email', 'Nickname', 'gender', 'CellphoneNumber', 'text'], 'required'],
            [['id', 'CellphoneNumber'], 'integer'],
            [['text'], 'string'],
            [['title', 'slug', 'HomeAddress'], 'string', 'max' => 128],
            [['CompleteName', 'Email', 'Nickname'], 'string', 'max' => 32],
            [['gender'], 'string', 'max' => 2],
            [['commments'], 'string', 'max' => 300],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'CompleteName' => 'Complete Name',
            'slug' => 'Slug',
            'Email' => 'Email',
            'Nickname' => 'Nickname',
            'HomeAddress' => 'Home Address',
            'gender' => 'Gender',
            'CellphoneNumber' => 'Cellphone Number',
            'commments' => 'Commments',
            'text' => 'Text',
        ];
    }
}
