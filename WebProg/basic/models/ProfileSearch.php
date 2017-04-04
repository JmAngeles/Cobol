<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Profile;

/**
 * ProfileSearch represents the model behind the search form about `app\models\Profile`.
 */
class ProfileSearch extends Profile
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'CellphoneNumber'], 'integer'],
            [['title', 'CompleteName', 'slug', 'Email', 'Nickname', 'HomeAddress', 'gender', 'commments', 'text'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Profile::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'CellphoneNumber' => $this->CellphoneNumber,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'CompleteName', $this->CompleteName])
            ->andFilterWhere(['like', 'slug', $this->slug])
            ->andFilterWhere(['like', 'Email', $this->Email])
            ->andFilterWhere(['like', 'Nickname', $this->Nickname])
            ->andFilterWhere(['like', 'HomeAddress', $this->HomeAddress])
            ->andFilterWhere(['like', 'gender', $this->gender])
            ->andFilterWhere(['like', 'commments', $this->commments])
            ->andFilterWhere(['like', 'text', $this->text]);

        return $dataProvider;
    }
}
