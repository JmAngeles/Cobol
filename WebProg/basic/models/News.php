<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "news".
 *
 * @property integer $id
 * @property string $slug
 * @property string $CompleteName
 * @property string $Nickname
 * @property string $Email
 * @property string $HomeAddress
 * @property string $gender
 * @property integer $CellphoneNumber
 * @property string $comments
 */
class News extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'news';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['slug', 'CompleteName', 'Nickname', 'Email', 'HomeAddress', 'gender', 'CellphoneNumber', 'comments'], 'required'],
            [['CellphoneNumber'], 'integer'],
            [['slug', 'CompleteName', 'Nickname', 'Email', 'HomeAddress', 'gender'], 'string', 'max' => 128],
            [['comments'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'slug' => 'Slug',
            'CompleteName' => 'Complete Name',
            'Nickname' => 'Nickname',
            'Email' => 'Email',
            'HomeAddress' => 'Home Address',
            'gender' => 'Gender',
            'CellphoneNumber' => 'Cellphone Number',
            'comments' => 'Comments',
        ];
    }
}
